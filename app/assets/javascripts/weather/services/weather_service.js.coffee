angular.module('weatherApp').service 'WeatherService', ["$http", "$q", ($http, $q)->
  fetch: (cityName)->
    deferred = $q.defer()
    $http.get("/api/v1/weather/#{cityName}?token=#{window.token}").success (data)->
      deferred.resolve(data)
    .error (msg, code)->
      deferred.reject(msg)
    deferred.promise
]
