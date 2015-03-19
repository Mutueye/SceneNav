Model = require('bamjs/backbone').Model

class MDataBtn extends Model
	
	defaults:
		Name : ''
		Type : ''
		Url : ''

	getName: -> @get('Name')
	getType: -> @get('Type')
	getUrl: -> @get('Url')

module.exports = MDataBtn