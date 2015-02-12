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
		@changeNavSel('home')
		@root().router.navigate('#!/', trigger: true)

	clickMatters: (e) ->
		@changeNavSel('matters')
		@root().router.navigate('#!/matters', trigger: true)

	changeNavSel: (pageName) ->
		if pageName != currentPage
			if currentPage
				@$("[data-nav='#{currentPage}']").removeClass('sel')
			@$("[data-nav='#{pageName}']").addClass('sel')
			currentPage = pageName


module.exports = Nav