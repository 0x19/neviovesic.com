app.factory 'Page', ['$rootScope', '$http', '$window', ($rootScope, $http, $window) ->

	console.log 'Bitch! Dis aint real!'

	return new class Page

		constructor: ->
			@timestamp = Date.now()
			@failureAttempts = 0
			@pageData = null
			@fetchPageData()

		fetchPageData: (pageName) ->

			#if typeof @pageData is "undefined" or @pageData is null
			request = $http.get '/templates/page-data'
			request.then (result) =>
				@pageData = result.data
				
				if @pageData.Status is false and @failureAttempts < 5
					console.warn 'Could not load page data from server ... Refetching data ...'
					@failureAttempts += 1
					@fetchPageData()
				else if @pageData.Status is false and @failureAttempts >= 5
					console.error 'Failed permanently ... Reloading page now ...'
					$window.location = '/'

				if typeof pageName isnt 'undefined'
					@setPageHeaders(pageName)

		setPageHeaders: (page) ->
			if typeof @pageData is "undefined" or @pageData is null
				if @failureAttempts < 5
					@failureAttempts += 1
					@fetchPageData(page)

				return

			angular.forEach @pageData.Pages, (pd, index) ->
				if pd.Index == page
					$rootScope.title = pd.Title
					$rootScope.metaDescription = pd.Description
					$rootScope.metaKeywords = pd.Keywords

]