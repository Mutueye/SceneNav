Model = require('bamjs/backbone').Model

class BusList extends Model
	
	defaults:
		Name : ''
		BusLines : null

	getName: -> @get('Name')
	getBusLines: -> @get('BusLines')

module.exports = BusList