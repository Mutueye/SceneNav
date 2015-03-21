View = require('bamjs/view')

tmpl = require('./index.jade')
MatterList = require('../matter-list')
MatterGuide = require('../matter-guide')

MatterModel = require('../../model/matter-list')
MatterCollection = require('../../model/matter-list/collection')

class PageMatters extends View
	namespace = 'page-matters'
	

	events:
		'click #btn_bgxz' : 'onBtnBGXZ'
		'click #btn_yksl' : 'onBtnYKSL'
		'click #list_rmsx' : 'onListRMSX'
		'click #list_kstd' : 'onListKSTD'

	initialize: ->
		@$el.html(tmpl())

		@rmsxCollection = new MatterCollection()
		@rmsxCollection.url = 'data/list_rmsx.json'
		@rmsxCollection.fetch(
			reset : true
			#success : (collection, resp, options)->
			#	console.info('请求成功触发')
			error:(collection, response)->
				console.info("error"+":"+response.responseText)
		)
		@rmsxlist = new MatterList(
			el:@$('#list_rmsx_content')
			parent : @
			collection : @rmsxCollection
		)

		
		@kstdCollection = new MatterCollection()
		@kstdCollection.url = 'data/list_kstd.json'
		@kstdCollection.fetch(
			reset : true
			#success : (collection, resp, options)->
			#	console.info('请求成功触发')
			error:(collection, response)->
				console.info("error"+":"+response.responseText)
		)
		@kstdlist = new MatterList(
			el:@$('#list_kstd_content')
			parent : @
			collection : @kstdCollection
		)

		@matterguide = new MatterGuide(
			el : @$('#matter_guide')
			parent : @
		)
		

	setMatterGuide: (param) ->
		#nodeUrl = 'data/' + param + '.json'
		nodeUrl = 'handler/' + param
		@matterguide.buildMatterNode(nodeUrl)

	# events #
	onBtnBGXZ: (e) ->
		alert('表格下载页面建设中')

	onBtnYKSL: (e) ->
		alert('一口受理页面建设中')

	onListRMSX: (e) ->
		@$('#list_rmsx_content').toggleClass('mobile-hidden')
		@$('#list_rmsx_arrow').toggleClass('box-title-arrow-down')
		@$('#list_rmsx_arrow').toggleClass('box-title-arrow-up')


	onListKSTD: (e) ->
		@$('#list_kstd_content').toggleClass('mobile-hidden')
		@$('#list_kstd_arrow').toggleClass('box-title-arrow-down')
		@$('#list_kstd_arrow').toggleClass('box-title-arrow-up')
		
	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')
		
module.exports = PageMatters