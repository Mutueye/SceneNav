View = require('bamjs/view')

tmpl = require('./index.jade')

class MatterGuideNode extends View
	namespace = 'matter-guide-node'

	initialize: ->
		@$el.html(tmpl(
			mNode : @model
		))


module.exports = MatterGuideNode