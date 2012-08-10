class Rrauth.Models.User extends Backbone.Model
	paramRoot: 'user'

class Rrauth.Collections.UsersCollection extends Backbone.Collection
	model: Rrauth.Models.User
	url: '/user'
