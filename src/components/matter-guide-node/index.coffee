View = require('bamjs/view')
tmpl = require('./index.jade')

MatterGuideNodeSelected = require('../matter-guide-node-selected')
MatterGuideNodeBtns = require('../matter-guide-node-btns')
MatterGuideNodeTable = require('../matter-guide-node-table')
MDataBtn = require('../../model/mdata-btn')
MDataBtnCollection = require('../../model/mdata-btn/collection')
MDataTable = require('../../model/mdata-table')

class MatterGuideNode extends View
	namespace = 'matter-guide-node'

	initialize: ->
		@$el.html(tmpl())

	setNodeView: (type, selected_id, selected_url) ->

		@$el.html(tmpl(
			mNode : @model
			type : type
			s_id : selected_id
			s_url : selected_url
		))
		if @model.getType() == 'list'
			@mDataBtnCollection = new MDataBtnCollection()
			@mDataBtnCollection.url = @model.getDataUrl()
			@mDataBtnCollection.fetch(
				reset : true
				success : (collection, resp, options) ->
					if type == 'selected'
						name = collection.models[selected_id].getName()
						newMGNS = new MatterGuideNodeSelected(
							el : $('#title_'+selected_url)
						)
						newMGNS.setView(name)
					if type == 'end'
						$('#title_'+selected_url).html('请从以下分类中选择')
						newMGNB = new MatterGuideNodeBtns(
							el : $('#info_'+selected_url)
							collection: collection
						)
						newMGNB.setView()
				error : (collection, resp, options) ->
					alert('取数失败'+resp.responseText)
			)

		if @model.getType() == 'table'
			@mDataTable = new MDataTable()
			@mDataTable.url = @model.getDataUrl()
			@mDataTable.fetch(
				success : (model, resp, options) ->
					$('#title_'+selected_url).html(model.getName())
					newMGNT = new MatterGuideNodeTable(
						el : $('#info_'+selected_url)
						model : model
					)
					newMGNT.setView()
				error : (model, resp, options) ->
					alert('error'+ resp.responseText)
			)
			




module.exports = MatterGuideNode