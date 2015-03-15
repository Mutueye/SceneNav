View = require('bamjs/view')

MatterCollection = require('../../model/matter-list/collection')
tmpl = require('./index.jade')

class MatterList extends View
	namespace = 'matter-list'

	initialize: ->
		@collection.on(
			'reset', 
			-> @render(), 
			@ 
		)
		
	render : ->
		@$el.html(tmpl(
			matterCollection : @collection
		))



module.exports = MatterList
