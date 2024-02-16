# frozen_string_literal: true

Dry::Rails.container do
  # config.features = %i[application_contract]
  # auto_register!('lib', 'app/operations')
  register(:persistence_rom, -> { ROM.env })
  register(:delivery_place_repo, -> { Persistence::Repository::DeliveryPlaces.new(ROM.env) })
  register(:user_repo, -> { Persistence::Repository::Users.new(ROM.env) })
  register(:product_repo, -> { Persistence::Repository::Products.new(ROM.env) })
  register(:cart_item_repo, -> { Persistence::Repository::CartItems.new(ROM.env) })
  register(:order_repo, -> { Persistence::Repository::Orders.new(ROM.env) })
end
