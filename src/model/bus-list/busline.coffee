Model = require('bamjs/model')

class BusLine extends Model
	
	defaults:
		Name : ''
		Intro : ''

	getName: -> @get('Name')
	getIntro: -> @get('Intro')

module.exports = BusLine