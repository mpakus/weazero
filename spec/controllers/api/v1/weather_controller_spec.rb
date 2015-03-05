require "rails_helper"

RSpec.describe Api::V1::WeatherController, type: :controller do
  describe "GET #show/Boston" do
    context "with wrong token" do
      before(:each) do
        Weather.create([{ name: "Boston", opnw_id: 1 }, { name: "New York", opnw_id: 2 }])
      end

      it "can not get it" do
        get :show, id: "Boston", token: "wrong_token"
        expect(response).to have_http_status 403
        body = JSON.parse(response.body)
        expect(body["code"]).to eq 403
      end
    end

    context "with right token" do
      before(:each) do
        Weather.create([{ name: "Boston", opnw_id: 1 }, { name: "New York", opnw_id: 2 }])
      end

      it "can get it" do
        get :show, id: "Boston", token: Settings.token
        expect(response).to have_http_status 200
        body = JSON.parse(response.body)
        expect(body["name"]).to eq "Boston"
      end
    end
  end
end
