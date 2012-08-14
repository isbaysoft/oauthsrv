Rrauth.Views.Users ||= {}

class Rrauth.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]
  that: this

  events: {
    'click .edit-hover': 'edit'
    'click .save-changes': 'saveChanged'
    'change form[name=profileForm] input': 'changeValues'
    'keypress form[name=profileForm] input': 'updateOnEnter'
  }

  initialize: -> 
    _.bindAll(this, 'closeSync');
    this.model.bind('sync', this.closeSync);


  updateOnEnter: (e) ->
    if e.keyCode is 13
      this.changeValues(e)
      this.saveChanged() 

  editMode: (state) ->
    parentObject = this
    parentObject.$('.edit-tr').each (idx,item) ->
      $(item).hide()
      parentObject.$('table a.edit-hover').each (x,e) ->
        if state is true
          $(e).show()
        else
          $(e).hide()


  closeSync: ->
    this.setContent()
    this.editMode(false)

  changeValues: (e) ->
    obj = this.$(e.target)
    this.model.set(obj.attr('name'),obj.val())

  saveChanged: (e) ->
    this.model.save()

  edit: (e) ->
    @.editMode(this.$(e.target).closest('tr').next('tr'),true)    
    e.preventDefault()

  setContent: =>
    parentObject = this
    attributes = {'email':'Email','first_name': 'First Name', 'last_name': 'Last Name', 'alternate_name': 'Alternate Name', 'new_password': 'Password'}
    $.each attributes, (key, val) ->
      parentObject.$('#profile_table #tr_'+key+'_id td.value').html(parentObject.model.get(key))

  render: =>
    $(@el).html(@template(model: @model))

    rowTemplate = JST["backbone/templates/users/row"]
    attributes = {'email':'Email','first_name': 'First Name', 'last_name': 'Last Name', 'alternate_name': 'Alternate Name', 'new_password': 'Password'}
    parentObject = this
    parentModel = @model
    $.each attributes, (key, val) ->
      try
        editTemplate = JST["backbone/templates/users/"+key+"_edit_form"]
        parentObject.$('#profile_table tbody').append(rowTemplate(id: "#{key}_id", caption: val, value: parentModel.get(key)))
        #parentObject.$('#profile_table tbody tr.edit-tr#edit_'+key+'_id').append(editTemplate())
        parentObject.$('#profile_table tbody').append(editTemplate())
      catch err

    return this