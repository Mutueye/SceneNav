View = require('bamjs/view')
tmpl = require('./index.jade')

class TableMaterials extends View
	namespace = 'table-materials'

	setView:  ->
		@$el.html(tmpl(
			collection : @collection
		))

module.exports = TableMaterials