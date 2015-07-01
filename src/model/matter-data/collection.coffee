Collection = require('bamjs/backbone').Collection

MatterData = require('./')

class MatterDataCollection extends Collection
	model : MatterData

module.exports = MatterDataCollection