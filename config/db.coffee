mysqlAdapter = require 'sails-mysql'

# Build A Config Object
module.exports =

	# Setup Adapters
	# Creates named adapters that have have been required
	'adapters':
		'default': mysqlAdapter
		'mysql': mysqlAdapter

	# Build Connections Config
	# Setup connections using the named adapter configs
	'connections':

		'myLocalMySql':
			'adapter': 'mysql'
			'host'		: 'localhost'
			'port'		: 8889
			'user' 		: 'root'
			'password'	: 'root'
			'database'	: 'UnitTesting'

	'defaults':
		'migrate': 'alter'