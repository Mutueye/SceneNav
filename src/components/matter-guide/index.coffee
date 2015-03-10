View = require('bamjs/view')

tmpl = require('./index.jade')

class MatterGuide extends View
	namespace = 'matter-guide'

	events:
		'touchstart .btn-reselect' : 'onCssTouchStart'
		'touchstart .btn-select-matter' : 'onCssTouchStart'
		'touchend .btn-reselect' : 'onCssTouchEnd'
		'touchmove .btn-reselect' : 'onCssTouchEnd'
		'touchend .btn-select-matter' : 'onCssTouchEnd'
		'touchmove .btn-select-matter' : 'onCssTouchEnd'

	initialize: ->
		@$el.html(tmpl())

	# events

	onCssTouchStart: (e) ->
		$(e.target).addClass('touched')

	onCssTouchEnd: (e) ->
		$(e.target).removeClass('touched')



module.exports = MatterGuide