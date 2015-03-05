angular.module('weatherApp').controller 'WeatherCtrl', ["$scope", "$stateParams", "WeatherService", ($scope, $stateParams, WeatherService)->
  cityName = if $stateParams.cityName then $stateParams.cityName else "Boston"

  WeatherService.fetch(cityName).then (city)->
    $scope.city = city
  ,
    (error)-> alert(error.msg)
]
