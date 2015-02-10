var fs = require('fs');
var path = require('path');

var gulp = require('gulp');
var gutil = require('gulp-util');
var duration = require('gulp-duration');
var plumber = require('gulp-plumber');
var source = require('vinyl-source-stream');
var streamify = require('gulp-streamify');
var argv = require('minimist')(process.argv);

var http = require('http');
var connect = require('connect');
var serveStatic = require('serve-static');
var lr = require('tiny-lr');
var injectLr = require('connect-livereload');
var cors = require('cors');

var jade = require('gulp-jade');
var stylus = require('gulp-stylus');
var uglify = require('gulp-uglify');
var prefix = require('gulp-autoprefixer');
var watchify = require('watchify');
var browserify = require('browserify');
var coffeeify = require('coffeeify');
var jadeify = require('browserify-jade').jade({pretty: false});

var through = require('through');

var merge = require('lodash.merge');

var APPS = [
	{ name: 'webapp', defaultState: '' }
];

var DEFAULT_APP = 'webapp';

var APP_PORT = 8080;
var LR_PORT = 35729;
var APP_PORTS = { 'default': APP_PORT };
var LR_PORTS = { 'default': LR_PORT };

for(var i=0; i< APPS.length; i++) {
	APP_PORTS[APPS[i].name] = APP_PORT + i + 1;
	LR_PORTS[APPS[i].name] = LR_PORT + i + 1;
}

var BUNDLERS = {};
var CONNECT_SERVERS = {};
var LR_SERVERS = {};
var ALL_APPS = false;

// Make sure settings.json exists
/*
if(!fs.existsSync('settings.json')) {
	contents = JSON.stringify({
		notifications: {
			build: true,
			error: true
		}
	}, null, '	');
	fs.writeFileSync('settings.json', contents);
}
var settings = JSON.parse(fs.readFileSync('settings.json'));
*/




// Utility
//--------------------------------------------------------------------------------------------------

function getAppState(appname) {
	for(var i=0; i< APPS.length; i++) {
		if(APPS[i].name === appname) {
			return APPS[i].defaultState;
		}
	}
	return '';
}

// get the live reload port
function getLrPort(appname) {
	if(ALL_APPS && LR_PORTS[appname]) {
		return LR_PORTS[appname];
	}
	return LR_PORTS['default'];
}

function getAppPort(appname) {
	if(ALL_APPS && APP_PORTS[appname]) {
		return APP_PORTS[appname];
	}
	return APP_PORTS['default'];
}

function setDest(appname, env) {
	return './build/' + env + '/' + appname + '/';
}

function handleError(err, callback){
	gutil.log(err);
	if(callback) {
		callback();
	}
}

function handlePlumberError(err) {
	console.log('plumber-error: ' + err);
}

// 当需要等待多个异步任务都执行完成后（而不知道哪个最后执行完成）再执行某项回调A时
// 将此函数套在需要执行的回调A上，给每个异步任务都执行此函数作为回调
// 参数count为需要等待完成的异步任务的个数。
function finished(count, callback){
	var complete = 0;
	return function() {
		if(++complete === count) {
			callback();
		}
	}
}

function run(callback) {
	return through(write, end);

	function write(buf) {
		this.queue(buf);
	};

	function end() {
		if(callback) {
			callback();
		}
		this.queue(null);
	}
}

// set the first letter to upercase
function ucfirst(s) {
	return s.slice(0, 1).toUpperCase() + s.substr(1);
}




// Browserify
//--------------------------------------------------------------------------------------------------

function configBundle(bundler, appname) {
	bundler = bundler
		.transform(coffeeify)
		.transform(jadeify);

	return bundler;
}

function bundle(appname, env, callback, extension, once) {
	extension = extension || '.coffee';
	var file = './src/apps/' + appname + '/index' + extension;
	var options = { extensions: ['.coffee', '.jade'] };
	//var bundler = once ? browserify : watchify;
	//var b = browserify({ cache: {}, packageCache: {}, fullPath: true });
	//var w = watchify(b, options).add(file);



	if(!BUNDLERS[appname]){
		BUNDLERS[appname] = configBundle(watchify(browserify(file, options)), appname)
			.on('update', function() {
				var done = finished(2, function() {
					triggerLr(getLrPort(appname), 'all');
				});
				bundle(appname, env, done);
				style(appname, env, done);
			});
	}

	var stream = BUNDLERS[appname]
		.bundle()
		.on('error', handleError)
		.pipe(source('app.js'))
		.pipe(streamify(uglify()))
		.pipe(duration('Bundling app "' + appname + '"'))
				.on('end', function() {
			console.log(ucfirst(appname) + ' is ready on http://localhost:' + APP_PORT);
		});

	stream.pipe(gulp.dest(setDest(appname, env)))
		.pipe(run(callback))

}

// Template
//--------------------------------------------------------------------------------------------------

function template(appname, env, locals, callback) {
	var base = './src/apps/' + appname;
	var isLocal = true;
	if(argv.local) {
		isLocal = argv.local;
	}
	locals = merge(
		{},
		{
			env: env,
			js: getJavascriptFiles(env, isLocal),
			settings: {
				env: env
			}
		},
		(locals || {})
	);

	gulp.src([base + '/*.jade'], { base: base })
		.pipe(plumber(handlePlumberError))
		.pipe(jade({
			pretty: false,
			locals: locals
		}))
		.pipe(duration('Compiling Jade for app "' + appname + '"'))
		.pipe(gulp.dest(setDest(appname, env)))
		.pipe(run(callback));
}

function getJavascriptFiles(env, local) {
	var suffix = (env === 'dev') ? '.js' : '.min.js';
	if(!local){
		return {
			'jquery': '//code.jquery.com/jquery-1.11.2' + suffix
		}
	} else {
		return {
			'jquery': 'jquery-1.11.2.min.js'
		}
	}
}



// Style
//--------------------------------------------------------------------------------------------------

function style(appname, env, callback) {
	var base = './src/apps/' + appname;

	var stream = gulp.src(base + '/index.styl', { base: base })
		.pipe(plumber(handlePlumberError))
		.pipe(stylus())
		.pipe(prefix('last 2 versions', { cascade: true }))
		.pipe(duration('Compiling Stylus for app "' + appname + '"'))

	stream.pipe(gulp.dest(setDest(appname, env)))
		.pipe(run(callback));
}




// Static
//--------------------------------------------------------------------------------------------------

function copyStatic(appname, env, callback) {
	var base = './src/static';
	var stream = gulp.src(base + '/**/*', { base: base })
		.pipe(plumber(handlePlumberError))
		.pipe(gulp.dest(setDest(appname, env)))
		.pipe(duration('Copying static files for app "' + appname + '"'))
		.pipe(run(callback));
}





// Serve
//--------------------------------------------------------------------------------------------------

function serve(appname, env, callback) {
	var root = './build/' + env + '/' + appname;
	var app = connect()
		.use(injectLr({ port: getLrPort(appname) }))
		.use(serveStatic(root))
		.use(cors());

	var server = http.createServer(app);
	var port = getAppPort(appname);
	server.listen(port, function(err) {
		if(err) {
			return handleError(err, callback);
		}
		gutil.log('Serving app "' + appname + '" on port: ' + port);
		if(callback) {
			callback();
		}
	});
}




// Watch
//--------------------------------------------------------------------------------------------------

function watch(appname, env) {
	watchStylus(appname, env);
	watchJade(appname, env);
}

function watchStylus(appname, env) {
	var files = [
		'./src/apps/' + appname + '/**/*.styl',
		'./src/apps/*.styl',
		'./src/components/**/*styl'
	];
	gulp.watch(files, function() {
		style(appname, env, function() {
			triggerLr(getLrPort(appname), 'css');
		});
	});
}

function watchJade(appname, env) {
	var files = [
		'./src/apps/' + appname + '/*.jade'
	];
	gulp.watch(files, function() {
		template(appname, env, null, function() {
			triggerLr(getLrPort(appname), 'all');
		});
	});
}





// LiveReload
//--------------------------------------------------------------------------------------------------

function startLr(appname, callback){
	var port = getLrPort(appname);
	LR_SERVERS[appname] = lr().listen(port, function(err) {
		if(err) {
			return handleError(err, callback);
		}
		gutil.log('Livereload for app "' + appname + '" on port: ' + port);
		if(callback && typeof(callback) === 'function') {
			callback();
		}
	});
}

function stopLr(appname) {
	LR_SERVERS[appname].close();
}

function triggerLr(port, type) {
	var query = '';
	if(type === 'all') {
		query = 'files=index.html';
	}
	if(type === 'css') {
		query = 'files=index.css';
	}
	http.get('http://127.0.0.1:' + port + '/changed?' + query);
}




// Custom tasks
//--------------------------------------------------------------------------------------------------

/* Build an app */
gulp.task('build', function() {
	var appname = argv.app || argv.a || DEFAULT_APP;
	var env = argv.env || argv.e || 'dev';

	template(appname, env);
	bundle(appname, env);
	style(appname, env);
	copyStatic(appname, env);
});

/* Serve an app */
gulp.task('serve', function() {
	var appname = argv.app || argv.a || DEFAULT_APP;
	var env = argv.env || argv.e || 'dev';

	ALL_APPS = argv.multiple || false;

	watch(appname, env);
	startLr(appname);
	serve(appname, env);
});


gulp.task('default', ['build', 'serve']);

