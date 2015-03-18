Browser = require "zombie"
async = require "async"
assert = require "assert"
route = require('express').Router()

# Load the page from localhost
browser = new Browser()

route.post '/runTest', (req, res) ->
	Models.test
		.findOrCreate { 'id': req.body.id },
			'test': "Log In and Buy Something",
			'visit': "http://localhost:3000/",
		.populate 'commands'
		.populate 'outcomes'
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
					run test


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
					
					if fill.selector and fill.data
						
						console.log fill
						console.log "Filling", fill.selector, "with", fill.data
						
						promise.fill fill.selector, fill.data

				# for loops through the select
				for select in cmd.selects
					
					if select.selector and select.data
						
						console.log "Selecting", select.selector, "with", select.data
						promise.select select.selector, select.data

				# loops through the actions
				async.eachSeries cmd.actions,
					(action, next) ->
						
						if action.action and action.selector
							
							console.log "Action", action.action, "on", action.selector
							# accesses the promise
							promise[action.action] action.selector, next
						
						else
							
							next()
					
					,done

			, (err) ->
				fails = []
				
				for outcome in test.outcomes
					
					if browser.text(outcome.selector) isnt outcome.data
						
						fails.push browser.text(outcome.selector), outcome.data
				
				if fails.length
					console.log "############### TEST FAILED ###############"
				
				else
					console.log "############### TEST PASSED ###############"


module.exports = route