View = require('bamjs/view')
MapNav = require('../map-nav')
SiteLogo = require('../sitelogo')

tmpl = require('./index.jade')

class PageHome extends View
	namespace = 'page-home'

	initialize: ->
		@$el.html(tmpl())

	draw: ->
		@mapnav = new MapNav(
			el: @$('.map-nav')
			parent: @
		)

		@sitelogo = new SiteLogo(
			el: @$('.sitelogo')
			parent: @
		)

	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')

module.exports = PageHome