var Waterline = require('Waterline');
var fs = require('fs');
var path = require('path');

var CoffeeScript = require("coffee-script");
CoffeeScript.register();
require('better-require')();

global.config = {
	'config': require("./config/config"),
	'db': require("./config/db"),
};

var orm = new Waterline();

fs.readdirSync("./models").forEach(function(file) {
	if(config.config.fileTypes.indexOf(path.extname(file)) > -1){
		orm.loadCollection( Waterline.Collection.extend( require("./models/" + file) ) );
	}
});


orm.initialize(config.db, function(err, models) {

	if(err) throw err;

	global.Models = models.collections

	require('./config/afterDB');

});