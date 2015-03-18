View = require('bamjs/view')

tmpl = require('./index.jade')

class MatterGuideNode extends View
	namespace = 'matter-guide-node'

	initialize: ->
		

	setNodeView: (type, selected_id) ->
		@$el.html(tmpl(
			mData : @model
			type : type
			id : selected_id
		))
		alert(type)


module.exports = MatterGuideNode