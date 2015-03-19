View = require('bamjs/view')
tmpl = require('./index.jade')

class TableDownload extends View
	namespace = 'table-download'

	setView:  ->
		@$el.html(tmpl(
			collection : @collection
		))

module.exports = TableDownload