View = require('bamjs/view')
tmpl = require('./index.jade')

class MatterGuideNodeBtns extends View
	namespace = 'matter-guide-node-btns'

	setView: ()  ->
		@$el.html(tmpl(
			collection : @collection
		))

module.exports = MatterGuideNodeBtns