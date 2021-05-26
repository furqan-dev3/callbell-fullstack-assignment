class Api::V1::CardsController < ApplicationController
  # TODO: Fill the controller actions for the API
  def index
    cards = Card.all
    if cards.present?
      render json: { success: true, response: cards.to_json, status: :ok }
    else
      error = {error: "No Card to Show"}
      render json: { success: false, response: error, status: :unprocessable_entity }
    end
  end

  def create
    response = CreateCard.call(card_params)
    if response.present?
      render json: { success: true, response: response, status: :ok }
    else
      error = {error: "Credentials are invalid"}
      render json: { success: false, response: error, status: :unprocessable_entity }
    end
  end

  private 

  def card_params
    params.require(:card).permit(:name, :description)
  end

end
