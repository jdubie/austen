App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'

App.Router.map (match) ->
  match('/').to('home')

App.ApplicationView = Em.View.extend
  templateName: require('templates/application')

App.ApplicationController = Em.Controller.extend
  currentUser: null

App.CurrentUser = Em.Object.extend
  username: null
  loggedIn: (() ->
    not @get('username')
  ).property('username')


App.LinkObject = Em.Object.extend
  url: null
  saved: false
  notSaved: (() ->
    not @get('saved')
  ).property('saved')

App.HomeRoute = Em.Route.extend
  setupControllers: (controller) ->
    link = App.LinkObject.create url: window.location.href
    user = App.CurrentUser.create()
    controller.set('link', link)
    controller.set('user', user)

    ## check if logged in
    #opts =
    #  url: '//m.com:3005/session'
    #  dataType: 'jsonp'
    #$.ajax(opts).statusCode
    #  200: (user) ->
    #    console.log 'hwefwe'
    #    user.set 'username', 'user-who-is-signed'
    #  403: -> console.log '403'

App.HomeController = Em.Controller.extend
  link: null
  user: null
  containerClass: null

App.HomeView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')
  templateName: require 'templates/home'
  testFoo: (a,b) ->
    this.get('controller').set('link', a.context)
    #console.log 'clickkk', a.context.get('title')

