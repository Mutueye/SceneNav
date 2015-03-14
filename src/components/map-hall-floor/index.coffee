View = require('bamjs/view')

MapHallBtn = require('../map-hall-btn')
MapHallBtnModel = require('../../model/map-hall-btn')

tmpl = require('./index.jade')

class MapHallFloor extends View
	namespace = 'map-hall-floor'

	initialize: ->
		@$el.html(tmpl(
			mhbcollection : @collection
		))

		for el, i in @$('.mhb')
			new MapHallBtn(
				el: el
				parent : @
				model : @collection.models[i]
			)

module.exports = MapHallFloor