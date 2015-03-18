View = require('bamjs/view')

MNode = require('../../model/mnode')
MatterGuideNode = require('../matter-guide-node')
tmpl = require('./index.jade')

class MatterGuide extends View
	namespace = 'matter-guide'
	currentNodeLevel = 0

	events:
		'touchstart .btn-reselect' : 'onCssTouchStart'
		'touchstart .btn-select-matter' : 'onCssTouchStart'
		'touchend .btn-reselect' : 'onCssTouchEnd'
		'touchmove .btn-reselect' : 'onCssTouchEnd'
		'touchend .btn-select-matter' : 'onCssTouchEnd'
		'touchmove .btn-select-matter' : 'onCssTouchEnd'

	initialize: ->
		@$el.html(tmpl())

	testFunc: ->
		alert('test')

	buildMatterNode: (nodeUrl) ->
		@targetMNode = new MNode()
		@targetMNode.url = nodeUrl
		@targetMNode.fetch(
			success : (model, resp, options)->
				console.log('读取导航节点数据成功')
				if(currentNodeLevel < model.getLevel())
					return
				$('.matter-guide-title').after('<div id="level_0"></div>')
				new MatterGuideNode(
					el : $('#level_0')
					model : model
				)

			error : (model, respm, options)->
				console.error('读取导航节点数据失败')
		)

	


	# events

	onCssTouchStart: (e) ->
		$(e.target).addClass('touched')

	onCssTouchEnd: (e) ->
		$(e.target).removeClass('touched')



module.exports = MatterGuide