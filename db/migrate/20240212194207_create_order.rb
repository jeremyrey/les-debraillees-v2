# frozen_string_literal: true

class CreateOrder < ActiveRecord::Migration[7.0]

  def change
    create_table(:orders) do |t|
      t.belongs_to(:user)
      t.integer(:total)
      t.timestamps
    end
  end

end
