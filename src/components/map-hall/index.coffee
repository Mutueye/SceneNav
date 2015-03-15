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
				Link : ''
			}
			{
				Number : 2
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '738px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 3
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '770px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 4
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '802px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 5
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '854px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 6
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '886px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 7
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '918px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 8
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '950px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 9
				Name : '高新区国家税务局'
				Direction : 'up'
				Xpos : '982px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 10
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1033px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 11
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1065px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 12
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1097px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 13
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1129px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 14
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1161px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 15
				Name : '青岛地税局高新区分局'
				Direction : 'up'
				Xpos : '1215px'
				Ypos : '400px'
				Link : ''
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
				Link : ''
			}
			{
				Number : 2
				Name : '统一收发件'
				Direction : 'up'
				Xpos : '684px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 3
				Name : '统一收发件'
				Direction : 'up'
				Xpos : '716px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 4
				Name : '企业联办'
				Direction : 'up'
				Xpos : '748px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 5
				Name : '外资审批项目企业核准'
				Direction : 'up'
				Xpos : '801px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 6
				Name : '防雷审批'
				Direction : 'up'
				Xpos : '833px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 7
				Name : '建设项目规划审批'
				Direction : 'up'
				Xpos : '865px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 8
				Name : '建设项目土地预审'
				Direction : 'up'
				Xpos : '897px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 9
				Name : '消防设计验收备案'
				Direction : 'up'
				Xpos : '929px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 10
				Name : ''
				Direction : 'up'
				Xpos : '981px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 11
				Name : '建筑工程施工许可证'
				Direction : 'up'
				Xpos : '1013px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 12
				Name : '施工图设计审查'
				Direction : 'up'
				Xpos : '1045px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 13
				Name : '质量监督登记、安全监督登记'
				Direction : 'up'
				Xpos : '1077px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 14
				Name : '建设项目竣工验收、试生产'
				Direction : 'up'
				Xpos : '1109px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 15
				Name : '建设项目配套'
				Direction : 'up'
				Xpos : '1160px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 16
				Name : '水电气暖占掘路'
				Direction : 'up'
				Xpos : '1192px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 17
				Name : '危险化学品经营许可'
				Direction : 'up'
				Xpos : '1224px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 18
				Name : '中国联通'
				Direction : 'down'
				Xpos : '1257px'
				Ypos : '400px'
				Link : ''
			}
			{
				Number : 19
				Name : '工商档案查询'
				Direction : 'down'
				Xpos : '1109px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 20
				Name : '工商登记'
				Direction : 'down'
				Xpos : '1077px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 21
				Name : '企业设立一口受理'
				Direction : 'down'
				Xpos : '1045px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 22
				Name : '企业设立一口受理'
				Direction : 'down'
				Xpos : '1013px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 23
				Name : '企业设立一口受理'
				Direction : 'down'
				Xpos : '981px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 24
				Name : '公章备案'
				Direction : 'down'
				Xpos : '929px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 25
				Name : '组织机构代码证'
				Direction : 'down'
				Xpos : '897px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 26
				Name : '注册代理'
				Direction : 'down'
				Xpos : '865px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 27
				Name : '食品流通许可证、餐饮服务许可证'
				Direction : 'down'
				Xpos : '833px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 28
				Name : '代办服务'
				Direction : 'down'
				Xpos : '801px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 29
				Name : '综合服务窗口'
				Direction : 'down'
				Xpos : '748px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 30
				Name : ''
				Direction : 'down'
				Xpos : '716px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 31
				Name : '高投票务'
				Direction : 'down'
				Xpos : '684px'
				Ypos : '499px'
				Link : ''
			}
			{
				Number : 32
				Name : '中国移动'
				Direction : 'down'
				Xpos : '652px'
				Ypos : '499px'
				Link : ''
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