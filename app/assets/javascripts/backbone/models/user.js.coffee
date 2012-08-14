Backbone.sync = (method, model, options) ->
	return null unless method is 'update'
	model.unset 'id'

	options or (options = {})
	params =
	type: 'PUT'
	dataType: "json"
	params.url = model.url('new') or urlError()  unless options.url

	if not options.data and model
		params.contentType = "application/json"
		params.data = JSON.stringify(model.toJSON())

  $.ajax(_.extend(params, options));

class Rrauth.Models.User extends Backbone.Model
	paramRoot: 'user'


class Rrauth.Collections.UsersCollection extends Backbone.Collection
	model: Rrauth.Models.User
	url: '/user'

