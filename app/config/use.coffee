###################### Express Uses #######################
# These are the uses for express who would have thought	  #
###########################################################
express = require 'express'
session = require 'express-session'
# RedisStore = require('connect-redis')(session)
bodyParser = require 'body-parser'
bodyParser = require 'body-parser'

app.set 'view engine', 'jade'
app.use '/views', express.static '/views'
app.use bodyParser.json() # for parsing application/json
app.use bodyParser.urlencoded { 'extended': true } # for parsing application/x-www-form-urlencoded

# Assets i.e. CSS and JS
app.use '/assets', express.static './assets'

app.use bodyParser.json() # for parsing application/json
app.use bodyParser.urlencoded { 'extended': true } # for parsing application/x-www-form-urlencoded

app.locals.pretty = true

# Sessions
app.use session {
	'secret': 'tu+omKg+2RfyiHMkiNAVSNuy8qk9u+mm4Lk2ATLf',
	'resave': false,
	'saveUninitialized': true,
	# 'store': new RedisStore {}
}

# Adds things to views for easier rendering
app.use (req, res, next) ->
	res.locals.session = req.session
	res.locals.query = req.query
	
	next()