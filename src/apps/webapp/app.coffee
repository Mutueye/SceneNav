View = require('bamjs/view')
# { debounce, extend, range, intersection } = require('bamjs/underscore')
#qs = require('querystring')
#url = require('url')

Pages = 
	home: require('../../components/page-home')
	matters: require('../../components/page-matters')
	hall: require('../../components/page-hall')

Nav = require('../../components/nav')

class Webapp extends View
	namespace:'app'
	pages: {}

	initialize: ->
		@nav = new Nav(
			el: @$('.nav')
			parent: @
		)
		@showPage()

	showPage: (req) ->
		if !req
			page = 'home'
			param = null
		else
			page = req.name
			param = req.values[0]

		if param
			reqValues = param.split('_')

		newPage = @pages[page]

		if @currentPage 
			if @currentPage != newPage
				@currentPage.hide()
				@currentPage = newPage

		unless newPage
			# Build page #
			options = 
				el: @$("[id='!/#{page}']")
				parent: @
			@currentPage = new Pages[page](options)
			@pages[page] = @currentPage
		# show the page
		@currentPage.show()
		@nav.changeNavSel(page)
		if page == 'matters'
				@currentPage.setMatterGuide(reqValues)

module.exports = Webapp