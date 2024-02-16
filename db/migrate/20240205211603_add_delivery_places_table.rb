# frozen_string_literal: true

class AddDeliveryPlacesTable < ActiveRecord::Migration[7.0]

  def change
    create_table(:delivery_places) do |t|
      t.string(:name)
      t.text(:description)

      t.timestamps
    end
  end

end
