Model = require('bamjs/backbone').Model

class Matter extends Model
	
	defaults:
		Info : ''
		Link : ''

	getInfo: -> @get('Info')
	getLink: -> @get('Link')

module.exports = Matter
