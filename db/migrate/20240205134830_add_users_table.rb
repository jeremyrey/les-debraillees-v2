# frozen_string_literal: true

class AddUsersTable < ActiveRecord::Migration[7.0]

  def change
    create_table(:users) do |t|
      t.string(:first_name)
      t.string(:last_name)
      t.string(:phone)
      t.string(:password_digest)
      t.string(:password_confirmation)
      t.string(:email)

      t.timestamps
    end
  end

end
