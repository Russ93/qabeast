route = require('express').Router()

app.get '/', (req, res) ->
	res.render "index"

route.get '/', (req, res) ->

	res.render "user/dash"

route.post '/signup', (req,res) ->
	
	Models.user
		.findOrCreate {'username': req.body.username},
			'username': req.body.username
		.exec (err, user) ->
			
			if user.createdAt < new Date new Date() - 60000
				req.session.error = "That User Already Exists"
				res.redirect 'back'
			
			else
				
				res.json user

module.exports = route