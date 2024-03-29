# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[7.0]

  def change
    create_table(:cart_items) do |t|
      t.belongs_to(:user)
      t.belongs_to(:product)
      t.integer(:quantity)
      t.timestamps
    end
  end

end
