// Generated by CoffeeScript 1.8.0
(function() {
  app.config(function($stateProvider, $urlRouterProvider) {
    var footer_view, header_view;
    console.log("Processing out main application routes ...");
    $urlRouterProvider.otherwise('/');
    header_view = {
      templateUrl: '/templates/header/',
      controller: 'HeaderCtrl'
    };
    footer_view = {
      templateUrl: '/templates/footer/',
      controller: 'FooterCtrl'
    };
    $stateProvider.state('home', {
      url: '/',
      views: {
        '': {
          templateUrl: '/templates/home/',
          controller: function($scope) {}
        },
        'header@': header_view,
        'footer@': footer_view
      }
    });
    $stateProvider.state('biography', {
      url: '/biography',
      views: {
        '': {
          templateUrl: '/templates/biography/',
          controller: function($scope) {}
        },
        'header@': header_view,
        'footer@': footer_view
      }
    });
    return $stateProvider.state('contact', {
      url: '/contact',
      views: {
        '': {
          templateUrl: '/templates/contact/',
          controller: function($scope) {}
        },
        'header@': header_view,
        'footer@': footer_view
      }
    });
  });

}).call(this);
