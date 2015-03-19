route = require('express').Router()


route.get '/', (req, res) ->
	res.render "user/index"

route.post '/login', (req,res) ->
	req.render "user/dash"

module.exports = route