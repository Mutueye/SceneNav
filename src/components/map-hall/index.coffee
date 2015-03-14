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
		

		@mapHallBtnArray_F1 = [
			{
				Number : 1
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '706px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 2
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '738px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 3
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '770px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 4
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '802px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 5
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '854px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 6
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '886px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 7
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '918px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 8
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '950px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 9
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '982px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 10
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1033px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 11
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1065px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 12
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1097px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 13
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1129px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 14
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1161px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 15
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1215px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}

		]
		@mapHallBtnCollection_F1 = new MapHallBtnCollection(@mapHallBtnArray_F1)
		@mapHallFloor_F1 = new MapHallFloor(
			el : @$('#f1')
			parent : @
			collection : @mapHallBtnCollection_F1
		)


		@mapHallBtnArray_F2 = [
			{
				Number : 1
				Name : ''
				Direction : 'up'
				Xpos : '652px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 2
				Name : '统一收发件'
				Direction : 'up'
				Xpos : '684px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 3
				Name : '统一收发件'
				Direction : 'up'
				Xpos : '716px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 4
				Name : '企业联办'
				Direction : 'up'
				Xpos : '748px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 5
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '801px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 6
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '886px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 7
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '918px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 8
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '950px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 9
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '982px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 10
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1033px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 11
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1065px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 12
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1097px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 13
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1129px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 14
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1161px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}
			{
				Number : 15
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1215px'
				Ypos : '400px'
				Link : 'javascript:void(0)'
			}

		]
		@mapHallBtnCollection_F2 = new MapHallBtnCollection(@mapHallBtnArray_F2)
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