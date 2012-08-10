Rrauth.Views.Users ||= {}

class Rrauth.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  events: {
    'click a.to-edit': 'editUser'
  }

  editUser: (e) ->
    e.preventDefault()
    alert 'EDIT!!'
  
  render: =>
    $(@el).html(@template(@model.toJSON()))

    return this
