// Generated by CoffeeScript 1.8.0
(function() {
  var FooterCtrl, HeaderCtrl, NavigationCtrl,
    __slice = [].slice,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.BaseCtrl = (function() {
    BaseCtrl.register = function(app, name) {
      var _ref;
      if (name == null) {
        name = this.name || ((_ref = this.toString().match(/function\s*(.*?)\(/)) != null ? _ref[1] : void 0);
      }
      return app.controller(name, this);
    };

    BaseCtrl.inject = function() {
      var args;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return this.$inject = args;
    };

    function BaseCtrl() {
      var args, fn, index, key, _i, _len, _ref, _ref1;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      _ref = this.constructor.$inject;
      for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
        key = _ref[index];
        this[key] = args[index];
      }
      _ref1 = this.constructor.prototype;
      for (key in _ref1) {
        fn = _ref1[key];
        if (typeof fn !== 'function') {
          continue;
        }
        if ((key === 'constructor' || key === 'initialize') || key[0] === '_') {
          continue;
        }
        this.$scope[key] = (typeof fn.bind === "function" ? fn.bind(this) : void 0) || _.bind(fn, this);
      }
      if (typeof this.initialize === "function") {
        this.initialize();
      }
    }

    return BaseCtrl;

  })();

  NavigationCtrl = (function(_super) {
    __extends(NavigationCtrl, _super);

    function NavigationCtrl() {
      return NavigationCtrl.__super__.constructor.apply(this, arguments);
    }

    NavigationCtrl.register(app);

    NavigationCtrl.inject('$scope', '$state');

    NavigationCtrl.pageName = null;

    NavigationCtrl.isHomePage = false;

    NavigationCtrl.prototype.initialize = function() {
      this.$scope.pageName = this.$state.current.name;
      return this.$scope.isHomePage = this.$state.current.name === 'home';
    };

    return NavigationCtrl;

  })(BaseCtrl);

  HeaderCtrl = (function(_super) {
    __extends(HeaderCtrl, _super);

    function HeaderCtrl() {
      return HeaderCtrl.__super__.constructor.apply(this, arguments);
    }

    HeaderCtrl.register(app);

    return HeaderCtrl;

  })(NavigationCtrl);

  FooterCtrl = (function(_super) {
    __extends(FooterCtrl, _super);

    function FooterCtrl() {
      return FooterCtrl.__super__.constructor.apply(this, arguments);
    }

    FooterCtrl.register(app);

    return FooterCtrl;

  })(NavigationCtrl);

}).call(this);
