require 'rails_helper'

RSpec.describe Api::V1::CardsController, type: :controller do
  describe "GET /index" do
    before do
      get :index
    end

    it "return all cards" do
      expect(response).to have_http_status(:success)
    end
    
  end

  describe "POST /create" do
    it 'returns status ok' do
      expect(response).to have_http_status(:success)
    end
  end
end
