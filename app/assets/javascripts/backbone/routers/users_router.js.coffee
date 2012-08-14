class Rrauth.Routers.UsersRouter extends Backbone.Router
	initialize: (options) ->
		@user = new Rrauth.Models.User(options.user)
		@users = new Rrauth.Collections.UsersCollection(@user)

	routes:
		"index" : "index"
		"edit" : "edit"
		".*" : "index"
	
	index: ->
		@view = new Rrauth.Views.Users.IndexView(model: @user)
		$("#users").html(@view.render().el)

  edit: ->
    @view = new Rrauth.Views.Users.EditView(model: @users)
    $("#users").html(@view.render().el)

