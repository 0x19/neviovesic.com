app.config ($stateProvider, $urlRouterProvider) ->
	console.log "Processing out main application routes ..."

	$urlRouterProvider.otherwise('/')

	header_view =
		templateUrl: '/templates/header-mini/'
		controller: 'HeaderCtrl'

	footer_view =
		templateUrl: '/templates/footer/'
		controller: 'FooterCtrl'
	
	$stateProvider.state('home', {
		url: '/',
		views: {
			'': 
				templateUrl: '/templates/home/'
				controller: ($scope) ->
					
			'header@': 
				templateUrl: '/templates/header/'
				controller: 'HeaderCtrl'

			'footer@': footer_view
		}
	})

	$stateProvider.state('signin', {
		url: '/signin',
		views: {
			'': 
				templateUrl: '/templates/signin/'
				controller: ($scope) ->
					
			'header@': header_view,
			'footer@': footer_view
		}
	})