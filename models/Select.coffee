module.exports =

	# Define a custom table name
	'tableName': 'select'

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
		
		'command_id':
			'model': 'command'
		
		'command':
			'columnName': 'command_id'
			'type': 'integer'
			'foreignKey': true
			'references': 'command'
			'on': 'id'

		'selector':
			'type': 'string'
			'required': true
		
		'data':
			'type': 'string'
			'required': true