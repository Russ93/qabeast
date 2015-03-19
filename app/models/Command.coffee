module.exports =

	# Define a custom table name
	'identity': 'command'

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