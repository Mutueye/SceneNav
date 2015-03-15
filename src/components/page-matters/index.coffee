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

		
		#@rmsxModelArray = [
		#	{
		#		Info : '开办个人独资企业'
		#		Link : '#'
		#	}
		#	{
		#		Info : '外商投资企业营业执照办理'
		#		Link : '#'
		#	}
		#	{
		#		Info : '公司名称变更'
		#		Link : '#'
		#	}
		#	{
		#		Info : '证照章遗失补办'
		#		Link : '#'
		#	}
		#	{
		#		Info : '非公司企业集团注销'
		#		Link : '#'
		#	}
		#	{
		#		Info : '个体商户设立申请指南'
		#		Link : '#'
		#	}
		#]

		@rmsxCollection = new MatterCollection()
		@rmsxCollection.fetch(
			reset : true
			success : (collection, resp, options)->
				alert('请求成功触发！')
		)

		@kstdModelArray = [
			{
				Info : '外商投资企业分支机构设立'
				Link : '#'
			}
			{
				Info : '证照章遗失补办'
				Link : '#'
			}
			{
				Info : '开办个人独资企业'
				Link : '#'
			}
			{
				Info : '中外合资企业注册'
				Link : '#'
			}
			{
				Info : '外商投资企业营业执照办理'
				Link : '#'
			}
			{
				Info : '非公司企业集团注销'
				Link : '#'
			}
		]

		@kstdCollection = new MatterCollection(@kstdModelArray)

	draw: ->
		@matterguide = new MatterGuide(
			el : @$('#matter_guide')
			parent : @
		)

		@rmsxlist = new MatterList(
			el:@$('#list_rmsx_content')
			parent : @
			collection : @rmsxCollection
		)

		@kstdlist = new MatterList(
			el:@$('#list_kstd_content')
			parent : @
			collection : @kstdCollection
		)

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