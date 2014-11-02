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
				controller: 'PageCtrl'
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('biography', {
		url: '/biography',
		views: {
			'': 
				templateUrl: '/templates/biography/'
				controller: 'PageCtrl'
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('contact', {
		url: '/contact',
		views: {
			'': 
				templateUrl: '/templates/contact/'
				controller: 'PageCtrl'
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('playground', {
		url: '/playground',
		views: {
			'': 
				templateUrl: '/templates/playground/'
				controller: 'PageCtrl'
					
			'header@': header_view
			'footer@': footer_view
		}
	})

	$stateProvider.state('404', {
		url: '/404',
		views: {
			'': 
				templateUrl: '/templates/404/'
				controller: 'PageCtrl'
					
			'header@': header_view
			'footer@': footer_view
		}
	})