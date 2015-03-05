require "rails_helper"

RSpec.describe CityWeather do
  it "is get correct name & id of city" do
    city = CityWeather.fetch([4_930_956]).shift
    expect(city).to include :temp, :wind
    expect(city[:name]).to eq "Boston"
    expect(city[:opnw_id]).to eq 4_930_956
  end
end
