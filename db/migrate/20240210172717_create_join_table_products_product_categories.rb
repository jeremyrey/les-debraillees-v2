# frozen_string_literal: true

class CreateJoinTableProductsProductCategories < ActiveRecord::Migration[7.0]

  def change
    create_table(:products_product_categories, id: false) do |t|
      t.integer(:product_id)
      t.integer(:product_category_id)
    end
  end

end
