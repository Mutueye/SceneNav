View = require('bamjs/view')

tmpl = require('./index.jade')

class MapNav extends View
	namespace = 'map-nav'

	initialize: ->
		@$el.html(tmpl())

module.exports = MapNav