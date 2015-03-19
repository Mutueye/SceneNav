Model = require('bamjs/backbone').Model

class MDataTable extends Model
	
	defaults:
		Name : ''
		ID : ''
		Type : ''
		Unit : ''
		TimeLimit : ''
		Conditions : ''
		Materials : ''
		Procedures : ''
		Basis : ''
		Forms : ''

	getName: -> @get('Name')
	getID: -> @get('ID')
	getType: -> @get('Type')
	getUnit: -> @get('Unit')
	getTimeLimit: -> @get('TimeLimit')
	getConditions: -> @get('Conditions')
	getMaterials: -> @get('Materials')
	getProcedures: -> @get('Procedures')
	getBasis: -> @get('Basis')
	getForms: -> @get('Forms')


module.exports = MDataTable