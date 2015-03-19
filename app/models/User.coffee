sha256 = require('js-sha256').sha256
uuid = require 'node-uuid'

module.exports = 

	# Define a custom table name
	'identity': 'user'

	'connection': 'myLocalMySql'

	# Define attributes for this collection
	'attributes':
		
		'id':
			'type': 'string',
			'unique': true
			'primaryKey': true,
			'defaultsTo': uuid.v4
			'maxLength': 36

		'username':
			'type': 'string'
			'unique': true

		'password':
			'type': 'string'

	'verifyPassword': (password) ->
		
		return this.password is sha256 "portlight44" + this.id + password
	
	'setPassword': () ->
		
		this.password = sha256 "portlight44"+this.id+password
		return this.save()