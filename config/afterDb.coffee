async = require("async")
fs = require('fs')
path = require('path')
fixtures = require("./fixtures")

async.eachSeries Object.keys(fixtures),
(f, done) ->

	async.whilst(
		() -> return fixtures[f].length > 0 ,
		(next) ->
			fix = fixtures[f].splice(0,1)[0]
			
			Models[f]
				.findOrCreate fix,
					fix
				.exec (err) ->
					console.log err
					next()
		,done)
,() ->

	fs.readdirSync("./controllers").forEach (file) ->
		
		if config.config.fileTypes.indexOf( path.extname file ) > -1
			require "../controllers/" + file