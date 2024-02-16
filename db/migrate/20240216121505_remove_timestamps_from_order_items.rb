# frozen_string_literal: true

class RemoveTimestampsFromOrderItems < ActiveRecord::Migration[7.0]

  def change
    remove_column(:order_items, :created_at, :string)
    remove_column(:order_items, :updated_at, :string)
  end

end
