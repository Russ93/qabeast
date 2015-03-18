###################### Express Uses #######################
# These are the uses for express who would have thought	  #
###########################################################
express = require 'express'
session = require 'express-session'
RedisStore = require('connect-redis')(session)
bodyParser = require 'body-parser'
ejs = require 'ejs-mate'
bodyParser = require 'body-parser'
# Set View Engine to EJS
app.engine 'ejs', ejs

# set templating engine to ejs
app.set 'view engine', 'ejs'
app.use '/views', express.static '/views'
app.use '/views/about', express.static '/views/about'
app.use '/views/careers', express.static '/views/careers'
app.use bodyParser.json() # for parsing application/json
app.use bodyParser.urlencoded { 'extended': true } # for parsing application/x-www-form-urlencoded

# Assets i.e. CSS and JS
app.use '/assets', express.static './assets'

app.use bodyParser.json() # for parsing application/json
app.use bodyParser.urlencoded { 'extended': true } # for parsing application/x-www-form-urlencoded

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