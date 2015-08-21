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
		if !$('[data-nav = home]').hasClass('sel')
			@changeNavSel('home')
			@root().router.navigate('#!/', trigger: true)

	clickMatters: (e) ->
		if !$('[data-nav = matters]').hasClass('sel')
			@changeNavSel('matters')
			@root().router.navigate('#!/matters/mNode', trigger: true)

	clickWSBS: (e) ->
		alert('建设中')
		# window.open("http://gxqsp.qingdao.gov.cn/Channel/Catalog.aspx?Catalog=00005","_blank");

	clickLSLP: (e) ->
		if $('[data-nav = lslp-sub]').css('display') == 'none'
			$('[data-nav = lslp-sub]').fadeIn(100)
			$(document).one('click',()-> $('[data-nav = lslp-sub]').fadeOut(100))
		else $('[data-nav = lslp-sub]').fadeOut(100)
		#阻止事件向上冒泡
		e.stopImmediatePropagation()

	clickLSLP1: (e) ->
		# window.open('http://www.baidu.com')
		alert('建设中')

	clickLSLP2: (e) ->
		# window.open('http://www.baidu.com')
		alert('建设中')

	clickHDJL: (e) ->
		alert('建设中')
		# window.open("http://gxqsp.qingdao.gov.cn/OnlineQuery/QueryList.aspx","_blank")



	changeNavSel: (pageName) ->
		if _.find(navPages, (navstring)-> navstring == pageName)
			if pageName != currentPage
				@$("[data-nav='#{pageName}']").addClass('sel')
				if currentPage
					@$("[data-nav='#{currentPage}']").removeClass('sel')
				currentPage = pageName


module.exports = Nav