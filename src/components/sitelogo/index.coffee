View = require('bamjs/view')

tmpl = require('./index.jade')

class SiteLogo extends View
	namespace = 'sitelogo'

	initialize: ->
		@$el.html(tmpl())


module.exports = SiteLogo