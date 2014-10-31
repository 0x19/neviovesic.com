app.config ($stateProvider, $urlRouterProvider) ->
	console.log "Processing out main application routes ..."

	$urlRouterProvider.otherwise('/')

	header_view =
		templateUrl: '/templates/header/'
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
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('biography', {
		url: '/biography',
		views: {
			'': 
				templateUrl: '/templates/biography/'
				controller: ($scope) ->
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('contact', {
		url: '/contact',
		views: {
			'': 
				templateUrl: '/templates/contact/'
				controller: ($scope) ->
					
			'header@': header_view
			'footer@': footer_view
		}
	})