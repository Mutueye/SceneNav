Model = require('bamjs/backbone').Model

class MapHallBtnModel extends Model
	
	defaults:
		Number : 0
		Name : ''
		Direction : ''
		Xpos : ''
		Ypos : ''
		Link : ''

	getNumber: -> @get('Number')
	getName: -> @get('Name')
	getDirection: -> @get('Direction')
	getXpos: -> @get('Xpos')
	getYpos: -> @get('Ypos')
	getLink: -> @get('Link')

module.exports = MapHallBtnModel