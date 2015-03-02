View = require('bamjs/view')

tmpl = require('./index.jade')

class MapNav extends View
	namespace = 'map-nav'

	events:
		'click [data-mappin = bus-stop-1]' : 'clickBusStop1'
		'click [data-mappin = bus-stop-2]' : 'clickBusStop2'
		'click [data-mappin = enter-hall]' : 'clickEnterHall'

	initialize: ->
		@$el.html(tmpl())

	# Events #
	clickBusStop1: (e) ->
		alert('bus stop 1 clicked')

	clickBusStop2: (e) ->
		alert('bus stop 2 clicked')

	clickEnterHall: (e) ->
		alert('enter-hall')

module.exports = MapNav