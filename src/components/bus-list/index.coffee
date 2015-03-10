View = require('bamjs/view')

BusListModel = require('../../model/bus-list')
tmpl = require('./index.jade')

class BusList extends View
	namespace = 'bus-list'

	events:
		'click .bus-list-bg' : 'hide'
		'click .btn-close-list' : 'hide'

	initialize: ->
		@$el.html(tmpl(
			resource : @model
		))

		# alert(@model.getBusLines().models[0])

	# events #
	hide : (e) ->
		@$('.bus-list-bg').addClass('hidden')
		@$('.bus-list').addClass('hidden')

	show : (e) ->
		@$('.bus-list-bg').removeClass('hidden')
		@$('.bus-list').removeClass('hidden')

module.exports = BusList

