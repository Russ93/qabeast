module.exports =

	# Define a custom table name
	'identity': 'outcome'

	'connection': 'myLocalMySql'

	# Define attributes for this collection
	'attributes':
		
		'id':
			'type': 'integer'
			'autoIncrement': true
			'primaryKey': true
			'unique': true

		'selector':
			'type': 'string'
			'required': true
		
		'data':
			'type': 'string'
			'required': true
		
		'test_id':
			'model': 'test'

		'test':
			'columnName': 'test_id'
			'type': 'integer'
			'foreignKey': true
			'references': 'test'
			'on': 'id'