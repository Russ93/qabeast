route = require('express').Router()


route.get '/', (req, res) ->
	res.json 
		'Working': "YAAAS"
		'Session': req.session

module.exports = route