service = 
	name: 'NevioVesic'
	version: 0.1

app = window.app = angular.module service.name, ['ui.router']


app.run ($rootScope, $state) ->
	$rootScope.$on '$stateChangeError', (event, toState, fromState, fromParams, error) ->
		$state.go '404'