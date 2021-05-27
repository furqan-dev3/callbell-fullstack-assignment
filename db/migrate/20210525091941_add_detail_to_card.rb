class AddDetailToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :name, :string
    add_column :cards, :description, :string
    add_column :cards, :card_id, :string
  end
end
