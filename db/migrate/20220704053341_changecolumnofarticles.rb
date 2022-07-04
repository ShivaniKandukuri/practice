class Changecolumnofarticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :user_id, :bigint
  end
end
