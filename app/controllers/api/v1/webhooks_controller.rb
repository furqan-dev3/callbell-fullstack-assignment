require 'trello'

class Api::V1::WebhooksController < ApplicationController

  def index
    render json: {:status => 200}
  end
  
  
  def create
    begin
      event = JSON.parse(request.body.read)
      service = WebhookCallManger.new(event)
      service.call
    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    end
    render json: {:status => 200}
  end
  
end
