View = require('bamjs/view')

MatterGuideNode = require('../matter-guide-node')
MatterDataCollection = require('../../model/matter-data/collection')
tmpl = require('./index.jade')

class MatterGuide extends View
	namespace = 'matter-guide'
	currentLevelNum = 0
	events:
		'touchstart .btn-reselect' : 'onCssTouchStart'
		'touchstart .btn-select-matter' : 'onCssTouchStart'
		'touchend .btn-reselect' : 'onCssTouchEnd'
		'touchmove .btn-reselect' : 'onCssTouchEnd'
		'touchend .btn-select-matter' : 'onCssTouchEnd'
		'touchmove .btn-select-matter' : 'onCssTouchEnd'

	initialize: ->
		@$el.html(tmpl())

	buildMatterNode: (reqValues) ->
		if !@matterDataCollection
			@matterDataCollection = new MatterDataCollection()
			@matterDataCollection.url = 'data/matterData.json'
			@matterDataCollection.fetch(
				reset : true
				success : (collection, resp, options) ->
					createMatterNodes(reqValues, collection)
				error : (collection, resp, options) ->
					console.error('Fetch data failure：' + resp.responseText)
			)
		else createMatterNodes(reqValues, @matterDataCollection)
		

	createMatterNodes = (reqValues, dataCollection) ->
		_currentData = _baseData = dataCollection.models
		_totleNum = _buildNum = reqValues.length
		if currentLevelNum > _buildNum
			_totleNum = currentLevelNum

		for i in[1.._totleNum]
			if i == 1
				_currentData = _baseData
				_dataType = 'list'
			if i == 2
				if _baseData[reqValues[1]]
					_dataType = _baseData[reqValues[1]].getType()
					_currentData = _baseData[reqValues[1]].getChildData()	
			if i >= 3
				if _currentData[reqValues[i-1]]
					_dataType = _currentData[reqValues[i-1]]['Type']
					_currentData = _currentData[reqValues[i-1]]['ChildData']

			if i <= _buildNum
				if !$('#level_'+i).html()
					$('#matter-guide-nodes').append('<div style="display:none;" id = "level_' + i + '"></div>')
				_matterGuideNode = new MatterGuideNode(el : $('#level_' + i))
				_matterGuideNode.setHtmlView(_currentData, _dataType, i, reqValues)
				$('#level_'+i).fadeIn(100)
			if i > _buildNum
				$('#level_'+i).fadeOut(100)

		currentLevelNum = _buildNum

	# events
	onCssTouchStart: (e) ->
		$(e.target).addClass('touched')

	onCssTouchEnd: (e) ->
		$(e.target).removeClass('touched')



module.exports = MatterGuide