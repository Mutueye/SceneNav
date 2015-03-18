Model = require('bamjs/backbone').Model

class MNode extends Model
	
	defaults:
		Type : ''
		Level : 0
		DataUrl : ''
		ParentUrl : ''
		ParentID : 0

	getType: -> @get('Type')
	getLevel: -> @get('Level')
	getDataUrl: -> @get('DataUrl')
	getParentUrl: -> @get('ParentUrl')
	getParentID: -> @get('ParentID')

module.exports = MNode