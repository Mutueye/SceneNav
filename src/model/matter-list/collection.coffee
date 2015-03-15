Collection = require('bamjs/collection')

Matter = require('./')

class Matters extends Collection
	model : Matter
	url : 'data/rmsx.json'

module.exports = Matters