module.exports =

	# Define a custom table name
	'tableName': 'test'
	'identity': 'test'

	# Set schema true/false for adapters that support schemaless
	'schema': true

	# Define an adapter to use
	'adapter': 'mysql'

	'connection': 'myLocalMySql'

	# Define attributes for this collection
	'attributes':

		'id':
			'type': 'integer'
			'autoIncrement': true
			'primaryKey': true
			'unique': true
		
		'test':
			'type': 'string'
			'required': true 
		'visit':
			'type': 'string'
			'required': true
		# 'command': { 'model': 'command' },
		'commands':
			'collection': 'command'
			'via': 'test_id'