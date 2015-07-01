View = require('bamjs/view')
MapNav = require('../map-nav')

tmpl = require('./index.jade')

class PageHome extends View
	namespace = 'page-home'

	initialize: ->
		@$el.html(tmpl())

		@mapnav = new MapNav(
			el: @$('.map-nav')
			parent: @
		)

	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')

module.exports = PageHome