Model = require('bamjs/backbone').Model

class MDataMaterial extends Model
	
	defaults:
		Name : ''

	getName: -> @get('Name')

module.exports = MDataMaterial