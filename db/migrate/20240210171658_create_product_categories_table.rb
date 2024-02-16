# frozen_string_literal: true

class CreateProductCategoriesTable < ActiveRecord::Migration[7.0]

  def change
    create_table(:product_categories) do |t|
      t.string(:code)
      t.string(:name)
      t.timestamps
    end
  end

end
