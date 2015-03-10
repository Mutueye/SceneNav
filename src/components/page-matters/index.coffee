View = require('bamjs/view')

tmpl = require('./index.jade')
MatterGuide = require('../matter-guide')

class PageMatters extends View
	namespace = 'page-matters'

	events:
		'click #btn_bgxz' : 'onBtnBGXZ'
		'click #btn_yksl' : 'onBtnYKSL'
		'click #list_rmsx' : 'onListRMSX'
		'click #list_kstd' : 'onListKSTD'

	initialize: ->
		@$el.html(tmpl())

	draw: ->
		@matterguide = new MatterGuide(
			el: @$('#matter_guide')
			parent: @
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