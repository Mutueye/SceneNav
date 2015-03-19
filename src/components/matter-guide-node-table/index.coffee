View = require('bamjs/view')
tmpl = require('./index.jade')
TableDownload = require('../table-download')
MFormBtns =require('../../model/mform-btn/collection')

class MatterGuideNodeTable extends View
	namespace = 'matter-guide-node-table'

	setView: ()  ->
		@$el.html(tmpl(
			model : @model
		))
		@mFormBtns = new MFormBtns()
		@mFormBtns.url = @model.getForms()
		@mFormBtns.fetch(
			success : (collection, resp, options) ->
				newTableDownload = new TableDownload(
					el : $('#forms')
					collection : collection
				)
				newTableDownload.setView()
			error : (collection, resp, options) ->
				console.log('error', resp.responseText)
		)


module.exports = MatterGuideNodeTable