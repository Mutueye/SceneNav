View = require('bamjs/view')
tmpl = require('./index.jade')
TableDownload = require('../table-download')
MFormBtns = require('../../model/mform-btn/collection')
TableMaterials = require('../table-materials')
MDataMaterials = require('../../model/mdata-material/collection')

class MatterGuideNodeTable extends View
	namespace = 'matter-guide-node-table'

	#initialise: ->
	#	@model.on(
	#		'change',
	#		-> @setView(),
	#		@
	#	)

	setView: ->
		@$el.html(tmpl(
			model : @model
		))

		@mDataMaterials = new MDataMaterials()
		@mDataMaterials.url = @model.getMaterials()
		@mDataMaterials.fetch(
			success : (collection, resp, options) ->
				newTM = new TableMaterials(
					el : $('#materials')
					collection : collection
				)
				newTM.setView()
			error : (collection, resp, options) ->
				alert('error: ' + resp.responseText)
		)


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