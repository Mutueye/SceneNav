View = require('bamjs/view')
tmpl = require('./index.jade')

MatterGuideNodeTable = require('../matter-guide-node-table')
MDataTable = require('../../model/mdata-table')

class MatterGuideNode extends View
	namespace = 'matter-guide-node'

	initialize: ->
		@$el.html(tmpl())

	setHtmlView:(data, dataType, levelId, reqValues) ->
		_selectedName = ''
		_currentUrl = ''
		_infoUrl = ''
		_btns = []

		if dataType == 'list'
			for dataItem,i  in data
				if levelId == 1
					_name = dataItem.getName()
					_type = dataItem.getType()
					_childData = dataItem.getChildData()
				else 
					_name = dataItem['Name']
					_type = dataItem['Type']
					_childData = dataItem['ChildData']
				_obj =
					Name : _name
					Type : _type
					ChildData : _childData
					id : i
				_btns.push(_obj)

		if(reqValues[levelId])
			_nodeType = 'selected'
			if levelId == 1
				_selectedName = data[reqValues[levelId]].getName()
			else if levelId >= 2
				_selectedName = data[reqValues[levelId]]['Name']
		else
			_nodeType = 'end'

		if levelId == 1 
			_currentUrl = reqValues[0]
		else
			for i in [1..levelId-1]
				_currentUrl += '_' + reqValues[i]
			_currentUrl = reqValues[0] + _currentUrl

		if dataType == 'info'
			_infoUrl = data
			@mDataTable = new MDataTable()
			@mDataTable.url = _infoUrl
			@mDataTable.fetch(
				success : (model, resp, options) ->
					$('#title_'+_currentUrl).html(model.getName())
					newMGNT = new MatterGuideNodeTable(
						el : $('#info_'+_currentUrl)
						model : model
					)
					newMGNT.setView()
				error : (model, resp, options) ->
					alert('error'+ resp.responseText)
			)


		@$el.html(tmpl(
			btns : _btns
			headNumber : levelId
			nodeType : _nodeType
			dataType : dataType
			selectedName : _selectedName
			currentUrl : _currentUrl
		))
	

module.exports = MatterGuideNode