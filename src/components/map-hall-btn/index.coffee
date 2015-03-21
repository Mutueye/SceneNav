View = require('bamjs/view')

tmpl = require('./index.jade')

class MapHallBtn extends View
	namespace : 'map-hall-btn'

	events:
		'mouseover .map-hall-btn' : 'selOn'
		'mouseout .map-hall-btn' : 'selOff'
		'click .map-pin-left' : 'onBtnClick'


	initialize: ->
		@$el.html(tmpl(
			data : @model
		))

		# 没有部门名称就不显示按钮了
		if(@model.getName() == '')
			@$('.map-hall-btn').hide()


	# events
	selOn: (e) ->
		@$('.map-hall-btn').addClass('sel')

	selOff: (e) ->
		@$('.map-hall-btn').removeClass('sel')

	onBtnClick: (e) ->
		if(@model.getLink() != '')
			window.open(@model.getLink())

module.exports = MapHallBtn