Model = require('bamjs/model')

class Matter extends Model
	
	defaults:
		Info : ''
		Link : ''

	getInfo: -> @get('Info')
	getLink: -> @get('Link')

module.exports = Matter
