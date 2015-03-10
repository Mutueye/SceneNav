Collection = require('bamjs/collection')

BusLine = require('./busline')

class BusLines extends Collection
	model : BusLine

module.exports = BusLines