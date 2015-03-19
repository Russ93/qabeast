# this file runs after the database connection has been established
async = require "async"
fs = require 'fs'
path = require 'path'




# Made to force data to the database from the fixtures.coffee
fixtures = require "./fixtures"

async.eachSeries Object.keys(fixtures),
(f, done) ->

	async.whilst(
		() -> return fixtures[f].length > 0 ,
		(next) ->
			fix = fixtures[f].splice(0,1)[0]
			
			Models[f]
				.findOrCreate fix, fix
				.exec (err) ->
					next()
		,done)
,() ->

	app.get "*", app.policies.shortcuts

	fs.readdirSync("./controllers").forEach (file) ->
		
		if config.config.fileTypes.indexOf( path.extname file ) > -1
			app.use "/" + path.basename(file, path.extname(file)), require "../controllers/" + file

	app.get "/*", (req, res) ->
		res.send '404'
