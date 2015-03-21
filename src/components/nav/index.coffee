View = require('bamjs/view')
_ = require('underscore')
tmpl = require('./index.jade')

class Nav extends View
	namespace = 'nav'
	currentPage = null
	navPages = ['home','matters']

	events:
		'click [data-nav = home]' : 'clickHome'
		'click [data-nav = matters]' : 'clickMatters'
		'click [data-nav = wsbs]' : 'clickWSBS'
		'click [data-nav = lslp]' : 'clickLSLP'
		'click [data-nav = lslp-sub1]' : 'clickLSLP1'
		'click [data-nav = lslp-sub2]' : 'clickLSLP2'
		'click [data-nav = hdjl]' : 'clickHDJL'

	initialize: ->
		@$el.html(tmpl())

	# Events #
	clickHome: (e) ->
		# if !$('[data-nav = home]').hasClass('sel')
		@changeNavSel('home')
		@root().router.navigate('#!/', trigger: true)

	clickMatters: (e) ->
		if !$('[data-nav = matters]').hasClass('sel')
			@changeNavSel('matters')
			#@root().router.navigate('#!/matters/mNode', trigger: true)
			@root().router.navigate('#!/matters/GetMNode.ashx', trigger: true)

	clickWSBS: (e) ->
		# window.open('http://www.baidu.com')
		alert('链接到高新区政务网网上办事页面')

	clickLSLP: (e) ->
		if $('[data-nav = lslp-sub]').css('display') == 'none'
			$('[data-nav = lslp-sub]').fadeIn(100)
			$(document).one('click',()-> $('[data-nav = lslp-sub]').fadeOut(100))
		else $('[data-nav = lslp-sub]').fadeOut(100)
		#阻止事件向上冒泡
		e.stopImmediatePropagation()

	clickLSLP1: (e) ->
		# window.open('http://www.baidu.com')
		alert('链接到高新区政务网市场主体设立联审联批页面')

	clickLSLP2: (e) ->
		# window.open('http://www.baidu.com')
		alert('链接到高新区政务网建设工程项目联审联批页面')

	clickHDJL: (e) ->
		# window.open('http://www.baidu.com')
		alert('链接到高新区政务网互动交流页面')



	changeNavSel: (pageName) ->
		if _.find(navPages, (navstring)-> navstring == pageName)
			if pageName != currentPage
				@$("[data-nav='#{pageName}']").addClass('sel')
				if currentPage
					@$("[data-nav='#{currentPage}']").removeClass('sel')
				currentPage = pageName


module.exports = Nav