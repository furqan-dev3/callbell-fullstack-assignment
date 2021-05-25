# frozen_string_literal: true
require 'trello'

class CreateCard

    def self.call(params) 
        new(params: params).call 
    end

    def initialize(params:)
        @params   = params
        @response = nil
    end

    def call
        client = Trello::Client.new(
            developer_public_key: ENV['TRELLO_KEY'],
            member_token: ENV['TRELLO_TOKEN'],
        )
        @response = client.create(:card, card_body)

    rescue StandardError
        nil
    end

    private

    attr_reader :params, :response

    def card_body
        {
            "name": params[:name], 
            "idList": ENV['TODOLIST'],
            "desc": params[:description]
        }
    end
end
