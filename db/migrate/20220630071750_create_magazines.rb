# frozen_string_literal: true

# app/model/magazine.rb
class CreateMagazines < ActiveRecord::Migration[6.0]
  def change
    create_table :magazines do |t|
      t.string :name
      t.integer :cost
      t.timestamps
    end
  end
end
