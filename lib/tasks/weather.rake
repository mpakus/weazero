namespace :weather do
  desc "fetch weather for Boston & NY from openweathermap.org"
  task fetch: :environment do
    begin
      cities = CityWeather.fetch(Settings.openweather.ids)
      cities.each do |city|
        if old_city = Weather.where(opnw_id: city[:opnw_id]).first
          old_city.update(city)
        else
          Weather.create!(city)
        end
      end
    rescue => e
      ap e
    end
  end
end
