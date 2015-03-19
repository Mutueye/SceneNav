View = require('bamjs/view')

MNode = require('../../model/mnode')
MatterGuideNode = require('../matter-guide-node')
tmpl = require('./index.jade')

class MatterGuide extends View
	namespace = 'matter-guide'
	currentNodeLevel = 0
	currentUrl = ''
	events:
		'touchstart .btn-reselect' : 'onCssTouchStart'
		'touchstart .btn-select-matter' : 'onCssTouchStart'
		'touchend .btn-reselect' : 'onCssTouchEnd'
		'touchmove .btn-reselect' : 'onCssTouchEnd'
		'touchend .btn-select-matter' : 'onCssTouchEnd'
		'touchmove .btn-select-matter' : 'onCssTouchEnd'

	initialize: ->
		@$el.html(tmpl())

	buildMatterNode: (nodeUrl) ->
		@targetMNode = new MNode()
		@targetMNode.url = nodeUrl
		@targetMNode.fetch(
			success : (model, resp, options)->
				setLevelID(model.getLevel(), currentNodeLevel)		
				if currentUrl != nodeUrl
					createOneNode(model, currentNodeLevel-1, currentUrl)
					appeendNewNode(model, 'end', null, null)
				currentNodeLevel = model.getLevel()
				currentUrl = nodeUrl

			error : (model, resp, options)->
				console.error('读取导航节点数据失败')
		)

	createOneNode = (childModel, thisNodeLevel, currentUrl)->
		if childModel.getParentUrl() != ''
			newMNode = new MNode()
			newMNode.url = childModel.getParentUrl()
			newMNode.fetch(
				success : (model, resp, options)->
					routerUrl = childModel.getParentUrl().slice(5,-5)
					if currentUrl != childModel.getParentUrl()
						createOneNode(model, thisNodeLevel-1)
					appeendNewNode(model, 'selected', childModel.getParentID(), routerUrl)			
				error : (model, resp, options)->
					console.error('读取父节点失败')
			)

	appeendNewNode = (model,type,selected_id,selected_url)->	
		matterGuideNode = new MatterGuideNode(
			el : $('#level_'+model.getLevel())
			model : model
		)
		matterGuideNode.setNodeView(type, selected_id,selected_url)

	setLevelID = (level, currentNodeLevel)->
		if(currentNodeLevel > level)
			$('#level_'+ currentNodeLevel).remove()
			setLevelID(level, currentNodeLevel-1)
		if(currentNodeLevel == level)
			if !$('#level_'+level).html()
				$('#matter-guide-nodes').append('<div id = "level_' + level + '"></div>')
		if(currentNodeLevel < level)
			if !$('#level_'+currentNodeLevel).html()
				$('#matter-guide-nodes').append('<div id = "level_' + currentNodeLevel + '"></div>')
			setLevelID(level, currentNodeLevel+1)
		
		
		


	


	# events

	onCssTouchStart: (e) ->
		$(e.target).addClass('touched')

	onCssTouchEnd: (e) ->
		$(e.target).removeClass('touched')



module.exports = MatterGuide