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
			param = null
		else
			page = req.name
			param = req.values[0]

			
		newPage = @pages[page]

		@currentPage?.hide()
		@currentPage = newPage
		unless newPage
			# Build page #
			options = 
				el: @$("[id='!/#{page}']")
				parent: @
			@drawPage(page, param, options)
			@pages[page] = @currentPage
		# show the page
		@currentPage.show(req)
		@nav.changeNavSel(page)
		switch page
			when 'matters'
				@currentPage.setMatterGuide(param)

	drawPage: (page, param, options) ->
		@currentPage = new Pages[page](options)



module.exports = Webapp