# frozen_string_literal: true

# app/models/school.rb
class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.text   :address
    end
  end
end
