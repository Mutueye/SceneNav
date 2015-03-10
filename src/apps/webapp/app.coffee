View = require('bamjs/view')
{ debounce, extend, range, intersection } = require('bamjs/underscore')
qs = require('querystring')
url = require('url')

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
		else
			page = req.name

			
		newPage = @pages[page]

		@currentPage?.hide()
		@currentPage = newPage
		unless newPage
			# Build page #
			options = 
				el: @$("[id='!/#{page}']")
				parent: @
			@drawPage(page, options)
			@pages[page] = @currentPage
		# show the page
		@currentPage.show(req)
		@nav.changeNavSel(page)

	drawPage: (page, options) ->
		@currentPage = new Pages[page](options)
		@currentPage.draw()



module.exports = Webapp