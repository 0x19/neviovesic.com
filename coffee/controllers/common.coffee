class @BaseCtrl
  @register: (app, name) ->
    name ?= @name || @toString().match(/function\s*(.*?)\(/)?[1]
    app.controller name, @
 
  @inject: (args...) ->
    @$inject = args
 
  constructor: (args...) ->
    
    for key, index in @constructor.$inject
      @[key] = args[index]
 
    for key, fn of @constructor.prototype
      continue unless typeof fn is 'function'
      continue if key in ['constructor', 'initialize'] or key[0] is '_'
      @$scope[key] = fn.bind?(@) || _.bind(fn, @)

    @initialize?()


class NavigationCtrl extends BaseCtrl
  
  @register app
  @inject '$scope', '$state'

  @pageName: null
  @isHomePage: false
  @isNavActive: false
  @isBiographyPage: false
  @isContactPage: false
  @isPlaygroundPage: false
  @isErrorPage: false

  initialize: ->
    @$scope.pageName   = @$state.current.name
    @$scope.isNavActive = @isNavActive

    @$scope.isHomePage = @$state.current.name == 'home'
    @$scope.isBiographyPage = @$state.current.name == 'biography'
    @$scope.isContactPage = @$state.current.name == 'contact'
    @$scope.isPlaygroundPage = @$state.current.name == 'playground'
    @$scope.isErrorPage = @$state.current.name == '404' or @$state.current.name == '500'

  toggleNav: ->
    if @$scope.isNavActive == undefined
      @$scope.isNavActive = false

    @$scope.isNavActive = @isNavActive = @$scope.isNavActive == false ? true : false;

class HeaderCtrl extends NavigationCtrl
  @register app
  
class FooterCtrl extends NavigationCtrl
  @register app