App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'

App.Router.map (match) ->
  match('/').to('home')
  match('/signup').to('signup')
  match('/login').to('login')
  #match('/:feed_id').to('/feed')
  #match('/:feed_id/:post_id').to('/feed')

App.ApplicationView = Em.View.extend
  templateName: require('templates/application')

App.CurrentUser = Em.Object.create
  username: null

App.HomeRoute = Em.Route.extend
  setupControllers: (controller) ->
    console.log 'setup controllers'
    #link = App.Link.create
    #controller.set('link', link)

    # check if logged in
    #$.getJSON('/session').statusCode
    #  200: (user) ->
    #    App.CurrentUser.set 'username', user.username
    #  403: -> console.log '403'

App.SignupRoute = Em.Route.extend {}
App.LoginRoute = Em.Route.extend {}
