module.exports = 

	# Define a custom table name
	'identity': 'action'

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
		
		'action':
			'type': 'string'
			'required': true