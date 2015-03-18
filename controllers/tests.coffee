Browser = require("zombie")
async = require("async")
assert = require("assert")

# Load the page from localhost
browser = new Browser()

Models.test
	.findOrCreate { 'test': "Log In and Buy Something" },
		'test': "Log In and Buy Something",
		'visit': "http://localhost:3000/",
	.populate 'commands'
	.exec (err, test) ->

		Models.command
			.find
				'id': [ x.id for x in test.commands ][0]
			.populate 'actions'
			.populate 'fills'
			.populate 'selects'
			.sort 'step asc'
			.exec (err, commands) ->
				
				test.commands = commands
				run(test)


run = (test) ->
	browser
	.visit test.visit, () ->
		console.log "Visited", test.visit
		
		async.eachSeries test.commands,
			(cmd, done) ->

				# This holds the promise
				promise = browser

				# for loops through the fill
				for fill in cmd.fills
					
					console.log fill
					console.log "Filling", fill.selector, "with", fill.data
					
					promise.fill fill.selector, fill.data

				# for loops through the select
				for select in cmd.selects
					console.log "Selecting", select.selector, "with", select.data
					promise.select select.selector, select.data

				# loops through the actions
				async.eachSeries cmd.actions,
					(action, next) ->

						console.log "Action",action.action, "on", action.selector
						# accesses the promise
						promise[action.action] action.selector, next
					
					,done

			, (err) ->
				if err
					console.log "Error:", err
				
				console.log "done"