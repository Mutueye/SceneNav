View = require('bamjs/view')
tmpl = require('./index.jade')

class MatterGuideNodeSelected extends View
	namespace = 'matter-guide-node-selected'

	setView: (name)  ->
		@$el.html(tmpl(
			name : name
		))

module.exports = MatterGuideNodeSelected