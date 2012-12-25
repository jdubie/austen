App.SignupView = Em.View.extend
  templateName: require('templates/signup')

App.SignupForm = Em.View.extend
  tagName: 'form'
  submit: (e) ->
    e.preventDefault()
    controller = this.get('controller')
    controller.submit()
