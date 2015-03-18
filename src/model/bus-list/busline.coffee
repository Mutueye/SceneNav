Model = require('bamjs/backbone').Model

class BusLine extends Model
	
	defaults:
		Name : ''
		Intro : ''

	getName: -> @get('Name')
	getIntro: -> @get('Intro')

module.exports = BusLine