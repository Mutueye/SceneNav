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
		#@rmsxCollection.url = 'handler/GetRmsxList.ashx'
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
		#@kstdCollection.url = 'handler/GetKstdList.ashx'
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

	setMatterGuide: (reqValues) ->
		@matterguide.buildMatterNode(reqValues)

	# events #
	onBtnBGXZ: (e) ->
		alert('建设中')
		# window.open("http://gxqsp.qingdao.gov.cn/Broadcast/Broadcast.aspx?type=infogsgg","_blank")

	onBtnYKSL: (e) ->
		alert('建设中')
		# window.open("http://gxqsp.qingdao.gov.cn/Bulletin/Businessview.aspx?infoFlowId=01870&infoFlowName=一口受理","_blank")

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