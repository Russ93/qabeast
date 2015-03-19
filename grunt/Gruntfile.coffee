module.exports = (grunt) ->
	grunt.initConfig
		'pkg': grunt.file.readJSON("package.json")

		'coffee':
			'glob_to_multiple':
				'expand': true
				'flatten': true
				'cwd': 'coffee/'
				'src': ['*.coffee']
				'dest': '../app/assets/js'
				'ext': '.js'

		'sass':
			'dist':
				'options':
					'outputStyle': "compressed"
				'files':
					"../app/assets/css/main.css": "sass/main.sass"

		'watch':
			'coffee':
				'files': "coffee/*.coffee"
				'tasks': ["coffee"]
				'options':
					'livereload': true
			'css':
				'files': "sass/*.sass"
				'tasks': ["sass"]
				'options':
					'livereload': true

	grunt.loadNpmTasks "grunt-sass"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.registerTask "default", [
		"coffee"
		"sass"
		"watch"
	]
	return