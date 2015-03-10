View = require('bamjs/view')

tmpl = require('./index.jade')

class MatterGuide extends View
	namespace = 'matter-guide'

	initialize: ->
		@$el.html(tmpl())

module.exports = MatterGuide