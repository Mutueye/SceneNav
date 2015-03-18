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
				console.log('读取导航节点数据成功')
				if currentNodeLevel < model.getLevel()
					createOneNode(model, currentNodeLevel-1, currentUrl)
					appeendNewNode(model,'end',null)

				if currentNodeLevel > model.getLevel()
					$('#level_'+currentNodeLevel).remove()
					createOneNode(model, currentNodeLevel-1, currentUrl)
					appeendNewNode(model,'end',null)

				if currentNodeLevel == model.getLevel()	
					if currentUrl != nodeUrl
						$('#level_'+currentNodeLevel).remove()
						createOneNode(model, currentNodeLevel-1, currentUrl)
						appeendNewNode(model,'end',null)

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
					console.log('读取父节点成功')
					if thisNodeLevel < model.getLevel()
						createOneNode(model, thisNodeLevel-1)
						appeendNewNode(model, 'selected', childModel.getParentID())

					if thisNodeLevel > model.getLevel()
						$('#level_'+thisNodeLevel).remove()
						createOneNode(model, thisNodeLevel-1)
						appeendNewNode(model, 'selected', childModel.getParentID())

					if thisNodeLevel == model.getLevel()
						if currentUrl != childModel.getParentUrl()
							$('#level_'+thisNodeLevel).remove()
							createOneNode(model, thisNodeLevel-1)
							appeendNewNode(model, 'selected', childModel.getParentID())

				error : (model, resp, options)->
					console.log('读取父节点失败')
			)

	appeendNewNode = (model,type,selected_id)->
		$('#matter-guide-nodes').append('<div id="level_'+ model.getLevel()+'"></div>')
		matterGuideNode = new MatterGuideNode(
			el : $('#level_'+model.getLevel())
			model : model
		)
		matterGuideNode.setNodeView(type, selected_id)


	


	# events

	onCssTouchStart: (e) ->
		$(e.target).addClass('touched')

	onCssTouchEnd: (e) ->
		$(e.target).removeClass('touched')



module.exports = MatterGuide