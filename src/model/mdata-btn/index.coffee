Model = require('bamjs/backbone').Model

class MDataBtn extends Model
	
	defaults:
		Name : ''
		Type : ''
		Url : ''

	getName: -> @get('Name')
	getTye: -> @get('Type')
	getUrl: -> @get('Url')

module.exports = MDataBtn