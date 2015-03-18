Waterline = require 'Waterline'
fs = require 'fs'
path = require 'path'
express = require 'express'
http = require 'http'

CoffeeScript = require "coffee-script"
CoffeeScript.register()
require('better-require')()

# Skeleton of and Application
global.app = express();
global.shortcuts = require "./config/shortcuts"

app.policies = require "./config/policies"

global.config =
	'config': require "./config/config"
	'db': require "./config/db"

orm = new Waterline()

fs.readdirSync "./models"
.forEach (file) ->
	if config.config.fileTypes.indexOf( path.extname( file ) ) > -1
		orm.loadCollection( Waterline.Collection.extend( require("./models/" + file) ) )

require './config/use'

orm.initialize config.db,
(err, models) ->

	if err
		throw err

	global.Models = models.collections

	require './config/afterDB'

	http.createServer(app).listen config.config.http, () ->
		console.log "QABeast Running on port:", config.config.http