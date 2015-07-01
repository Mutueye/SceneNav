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
			busListModel : @model
		))

	# events #
	hide : (e) ->
		#@$('.bus-list-bg').addClass('hidden')
		#@$('.bus-list').addClass('hidden')
		@$('.bus-list-bg').fadeOut(100)
		@$('.bus-list').fadeOut(100)

	show : (e) ->
		#@$('.bus-list-bg').removeClass('hidden')
		#@$('.bus-list').removeClass('hidden')
		@$('.bus-list-bg').fadeIn(100)
		@$('.bus-list').fadeIn(100)

module.exports = BusList

