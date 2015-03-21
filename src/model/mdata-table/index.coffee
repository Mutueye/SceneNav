Model = require('bamjs/backbone').Model

class MDataTable extends Model
	
	defaults:
		dic_name : ''
		id : ''
		AcceptDept : ''
		Address : ''
		Tel : ''
		PromiseTimeLimit : ''
		ProcessCondition : ''
		Materials : ''
		ProcessFoundation : ''
		Forms : ''

	getName: -> @get('dic_name')
	getID: -> @get('id')
	getUnit: -> @get('AcceptDept')
	getAddress: -> @get('Address')
	getTel : -> @get('Tel')
	getTimeLimit: -> @get('PromiseTimeLimit')
	getConditions: -> @get('ProcessCondition')
	getMaterials: -> @get('Materials')
	getBasis: -> @get('ProcessFoundation')
	getForms: -> @get('Forms')


module.exports = MDataTable