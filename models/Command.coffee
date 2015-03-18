module.exports =

	# Define a custom table name
	'tableName': 'command'
	'identity': 'command'

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
		
		'test_id':
			'model': 'test'
		
		'step':
			'type': 'integer'
		

		'actions':
			'collection': 'action'
			'via': 'command_id'

		'fills':
			'collection': 'fill'
			'via': 'command_id'
		
		'selects':
			'collection': 'select'
			'via': 'command_id'


		'test':
			'columnName': 'test_id'
			'type': 'integer'
			'foreignKey': true
			'references': 'test'
			'on': 'id'