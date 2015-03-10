Model = require('bamjs/model')

class BusList extends Model
	
	defaults:
		Name : ''
		BusLines : null

	getName: -> @get('Name')
	getBusLines: -> @get('BusLines')

module.exports = BusList