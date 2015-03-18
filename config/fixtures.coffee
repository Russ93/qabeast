module.exports = {
	'test':[
		{
			'id': 1
			'test': "Log In and Buy Something"
			'visit': "http://localhost:3000/"
		}
	]
	'command':[
		{
			'id': 1
			'test_id': 1
			'step': 1
		}
		{
			'id': 2
			'test_id': 1
			'step': 2
		}
	]
	'fill':[
		{
			'command_id': 2
			'selector': "email"
			'data': "portlight.rschlup@gmail.com"
		}
		{
			'command_id': 2
			'selector': "password"
			'data': "zxcvbnm9"
		}
	]
	# 'select':[

	# ]
	'action':[
		{
			'command_id': 1
			'selector': "a.userLogin"
			'action': "clickLink"
		}
		{
			'command_id': 2
			'selector': "button.col-xs-12"
			'action': "pressButton"
		}
	]
}