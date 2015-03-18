Model = require('bamjs/backbone').Model

class MDataTable extends Model
	
	defaults:
		ID : ''
		Type : ''
		Unit : ''
		TimeLimit : ''
		Conditions : ''
		Materials : ''
		Procedures : ''
		Basis : ''
		Forms : ''

	getID: -> @get('ID')
	getTye: -> @get('Type')
	getUnit: -> @get('Unit')
	getTimeLimit: -> @get('TimeLimit')
	getConditions: -> @get('Conditions')
	getMaterials: -> @get('Materials')
	getProcedures: -> @get('Procedures')
	getBasis: -> @get('Basis')
	getForms: -> @get('Forms')


module.exports = MDataTable