require "rails_helper"

RSpec.describe Weather, type: :model do
  it "is name empty" do
    weather = Weather.create(name: nil)
    weather.valid?
    expect(weather.errors[:name]).to include("can't be blank")
  end

  it "is opnw_in empty" do
    weather = Weather.create(opnw_id: nil)
    weather.valid?
    expect(weather.errors[:opnw_id]).to include("can't be blank")
  end
end
