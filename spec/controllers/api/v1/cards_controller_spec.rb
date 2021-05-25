require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :controller do
  describe "GET /index" do
    before do
      get :index
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(hash_body.keys).to match_array([:id, :name, :description])
    end
    # pending "add some examples (or delete) #{__FILE__}"
  end

  describe "POST /create" do
    it 'returns status ok' do
      expect(response).to have_http_status(:success)
    end
    # pending "add some examples (or delete) #{__FILE__}"
  end
end
