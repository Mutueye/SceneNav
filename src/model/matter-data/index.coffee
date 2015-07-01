Model = require('bamjs/backbone').Model

class MatterData extends Model
	
	defaults:
		Name : ''
		Type : ''
		ChildData : ''

	getName: -> @get('Name')
	getType: -> @get('Type')
	getChildData: -> @get('ChildData')

module.exports = MatterData