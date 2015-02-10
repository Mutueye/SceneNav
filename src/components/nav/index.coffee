View = require('bamjs/view')

tmpl = require('./index.jade')

class Nav extends View
	namespace = 'nav'
	currentPage = null

	events:
		'click [data-nav = home]' : 'clickHome'
		'click [data-nav = matters]' : 'clickMatters'

	initialize: ->
		@$el.html(tmpl())

	# Events #
	clickHome: (e) ->
		@changePage('home')
		@root().router.navigate('#!/', trigger: true)

	clickMatters: (e) ->
		@changePage('matters')
		@root().router.navigate('#!/matters', trigger: true)

	changePage: (pageName) ->
		if pageName != currentPage
			if currentPage
				@$("[data-nav='#{currentPage}']").removeClass('sel')
			@$("[data-nav='#{pageName}']").addClass('sel')
			currentPage = pageName


module.exports = Nav