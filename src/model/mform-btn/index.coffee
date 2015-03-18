Model = require('bamjs/backbone').Model

class MFormBtn extends Model
	
	defaults:
		Name : ''
		Url : ''

	getName: -> @get('Name')
	getUrl: -> @get('Url')

module.exports = MFormBtn