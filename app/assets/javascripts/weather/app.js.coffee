
angular.module 'weatherApp', ['ui.router','templates']

.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common['X-Auth-Token'] = window.token
]

.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise('app/weather/Boston')
  $stateProvider.state 'app',
    abstract: true,
    url: '/app',
    templateUrl: 'app.html'
  .state 'app.weather',
    url: '/weather/:cityName'
    controller: 'WeatherCtrl'
    templateUrl: 'weather.html'
]
