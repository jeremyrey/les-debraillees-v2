# frozen_string_literal: true

Factory.define(:user) do |f|
  f.first_name('Jérémy')
  f.last_name('Rey')
  f.email('rey.jeremy@hotmail.fr')
  f.password_digest('digestpassword')
  f.timestamps
end
