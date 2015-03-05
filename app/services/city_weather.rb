class CityWeather
  class << self
    def fetch(ids)
      response = RestClient.get(Settings.openweather.url % ids.join(","))
      data     = JSON.parse(response.body)
      weather  = []
      data["list"].each { |city| weather << parse(city) }
      weather
    rescue => e
      e
    end

    def parse(city)
      {
        temp: {
          current: city["main"]["temp"],
          min:     city["main"]["temp_min"],
          max:     city["main"]["temp_max"]
        },
        wind: {
          speed: city["wind"]["speed"],
          deg:   city["wind"]["deg"]
        },
        opnw_id: city["id"],
        name:    city["name"]
      }
    end
  end
end
