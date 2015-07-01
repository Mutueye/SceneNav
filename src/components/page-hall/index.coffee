View = require('bamjs/view')
MapHall = require('../map-hall')
tmpl = require('./index.jade')

class PageHall extends View
	namespace = 'page-hall'

	initialize: ->
		@$el.html(tmpl())

		@maphall = new MapHall(
			el: @$('.page-hall')
			parent: @
		)

	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')

module.exports = PageHall