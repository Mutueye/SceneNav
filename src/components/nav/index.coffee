View = require('bamjs/view')
_ = require('underscore')
tmpl = require('./index.jade')

class Nav extends View
	namespace = 'nav'
	currentPage = null
	navPages = ['home','matters']

	events:
		'click [data-nav = home]' : 'clickHome'
		'click [data-nav = matters]' : 'clickMatters'
		'click [data-nav = wsbs]' : 'clickWSBS'
		'click [data-nav = lslp]' : 'clickLSLP'
		'click [data-nav = lslp-sub1]' : 'clickLSLP1'
		'click [data-nav = lslp-sub2]' : 'clickLSLP2'
		'click [data-nav = hdjl]' : 'clickHDJL'

	initialize: ->
		@$el.html(tmpl())

	# Events #
	clickHome: (e) ->
		@changeNavSel('home')
		@root().router.navigate('#!/', trigger: true)

	clickMatters: (e) ->
		@changeNavSel('matters')
		@root().router.navigate('#!/matters', trigger: true)

	clickWSBS: (e) ->
		window.open('http://www.baidu.com')

	clickLSLP: (e) ->
		if $('[data-nav = lslp-sub]').css('display') == 'none'
			$('[data-nav = lslp-sub]').fadeIn(100)
			$(document).one('click',()-> $('[data-nav = lslp-sub]').fadeOut(100))
		else $('[data-nav = lslp-sub]').fadeOut(100)
		#阻止事件向上冒泡
		e.stopImmediatePropagation()

	clickLSLP1: (e) ->
		window.open('http://www.baidu.com')

	clickLSLP2: (e) ->
		window.open('http://www.baidu.com')

	clickHDJL: (e) ->
		window.open('http://www.baidu.com')



	changeNavSel: (pageName) ->
		if _.find(navPages, (navstring)-> navstring == pageName)
			if pageName != currentPage
				@$("[data-nav='#{pageName}']").addClass('sel')
				if currentPage
					@$("[data-nav='#{currentPage}']").removeClass('sel')
				currentPage = pageName


module.exports = Nav