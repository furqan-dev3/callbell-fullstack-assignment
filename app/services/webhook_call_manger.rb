class WebhookCallManger
    def initialize(event)
        @event = event
    end

    def call
      case @event['action']['type']
        when 'createCard'
          create_card
        when 'updateCard'
          update_card
        when 'deleteCard'
          delete_card
      end
    end
    

    private
     
    attr_reader :event
    
    def create_card
        card_data
        client = Trello::Client.new(
          developer_public_key: ENV['TRELLO_KEY'],
          member_token: ENV['TRELLO_TOKEN'],
        )
        card = client.find(:card, @card_data['id'])
        desc = card.attributes['desc']
        Card.create(card_id: @card_data['id'], name: @card_data['name'], description: desc)
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
        @card_data = event['action']['data']['card']
    end
end
