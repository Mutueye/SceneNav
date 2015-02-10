View = require('bamjs/view')

tmpl = require('./index.jade')

class PageMatters extends View
	namespace = 'page-matters'

	initialize: ->
		@$el.html(tmpl())

	draw: ->
		
	hide: ->
		@$el.addClass('hidden')

	show: ->
		@$el.removeClass('hidden')
module.exports = PageMatters