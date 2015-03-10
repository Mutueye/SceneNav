View = require('bamjs/view')

tmpl = require('./index.jade')

class PageHall extends View
	namespace = 'page-hall'

	initialize: ->
		@$el.html(tmpl())

	draw: ->

	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')

module.exports = PageHall