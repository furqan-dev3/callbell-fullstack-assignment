require 'rails_helper'

RSpec.describe Api::V1::WebhooksController, type: :controller do
 
  describe "POST /create" do
    it 'returns status 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
