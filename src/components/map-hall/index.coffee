View = require('bamjs/view')

tmpl = require('./index.jade')

MapHallFloor = require('../map-hall-floor')
MapHallBtnCollection = require('../../model/map-hall-btn/collection')

class MapHall extends View
	namespace = 'map-hall'

	events:
		'click #btn_return' : 'onReturn'
		'click #btn_f1' : 'onF1'
		'click #btn_f2' : 'onF2'

	initialize: ->
		@$el.html(tmpl())
		
		@mapHallBtnCollection_F1 = new MapHallBtnCollection()
		@mapHallBtnCollection_F1.url = 'data/hall_level_1.json'
		@mapHallBtnCollection_F1.fetch(
			reset : true
			success : (collection, resp, options) ->
				#alert('success')
			error : (collection, resp, options) ->
				alert('error: ' + resp.responseText)
		)
		@mapHallFloor_F1 = new MapHallFloor(
			el : @$('#f1')
			parent : @
			collection : @mapHallBtnCollection_F1
		)
 
		
		@mapHallBtnCollection_F2 = new MapHallBtnCollection()
		@mapHallBtnCollection_F2.url = 'data/hall_level_2.json'
		@mapHallBtnCollection_F2.fetch(
			reset : true
			success : (collection, resp, options) ->
				#alert('success')
			error : (collection, resp, options) ->
				alert('error: ' + resp.responseText)
		)
		@mapHallFloor_F2 = new MapHallFloor(
			el : @$('#f2')
			parent : @
			collection : @mapHallBtnCollection_F2
		)


		$('#f1').show()
		$('#f2').hide()



	# events
	onReturn: (e) ->
		@root().router.navigate('#!/', trigger: true)

	onF1: (e) ->
		$('#f1').fadeIn(100)
		$('#f2').fadeOut(100)
		$('.floor-indicator').removeClass('f2')

	onF2: (e) ->
		$('#f1').fadeOut(100)
		$('#f2').fadeIn(100)
		$('.floor-indicator').addClass('f2')

module.exports = MapHall