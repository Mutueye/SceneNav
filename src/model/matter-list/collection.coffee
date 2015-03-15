Collection = require('bamjs/collection')

Matter = require('./')

class Matters extends Collection
	model : Matter
	url : 'http://192.168.1.105:9090/TestFetch.aspx'

module.exports = Matters