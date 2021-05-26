class Api::V1::WebhooksController < ApplicationController
  
  def create
    begin
      @event = JSON.parse(request.body.read)
      case @event['action']['type']
        when 'createCard'
          create_card
        when 'updateCard'
          update_card
        when 'deleteCard'
          delete_card
      end
    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    end
    render json: {:status => 200}
  end

  private
      
  def create_card
    card_data
    Card.create(card_id: @card_data['id'], name: @card_data['name'], description: @card_data['desc'])
  end
  
  def update_card
    card_data
    card = Card.find_by(card_id: @card_data['id'])
    card.update(card_id: @card_data['id'], name: @card_data['name'], description: @card_data['desc']) if card.present?
  end

  def delete_card
    card_data
    card = Card.find_by(card_id: @card_data['id'])
    card.destroy if card.present?
  end

  def card_data
    @card_data = @event['action']['data']['card']
  end

end
