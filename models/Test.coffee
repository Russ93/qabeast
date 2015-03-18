module.exports =

	# Define a custom table name
	'identity': 'test'

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

		'outcomes':
			'collection': 'outcome'
			'via': 'test_id'