Collection = require('bamjs/backbone').Collection

BusLine = require('./busline')

class BusLines extends Collection
	model : BusLine

module.exports = BusLines