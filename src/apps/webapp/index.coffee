Backbone = require('bamjs/backbone')
Backbone.$ = $

App = require('./app')
Router = require('./router')

window.webapp = app = new App(el: document.body)
router = new Router(app)
app.router = router

Backbone.history.start(pushState: false)