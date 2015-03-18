################################ These are Policies ################################
# Policies are where you can stop some one from accessing things they shouldn't    #
# i.e. route.all('*', app.policies.mustBeLoggedIn);								   #
####################################################################################

module.exports =
	shortcuts: (req,res,next) ->
		if shortcuts[ req.params["0"] ]
			res.redirect( shortcuts[ req.params["0"] ] );
		
		else
			next();