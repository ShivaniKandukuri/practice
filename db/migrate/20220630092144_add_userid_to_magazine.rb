# frozen_string_literal: true

# app/model/magazine.rb
class AddUseridToMagazine < ActiveRecord::Migration[6.0]
  def change
    add_column :magazines, :user_id, :integer
  end
end
