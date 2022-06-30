class AddOfficeidToCabin < ActiveRecord::Migration[6.0]
  def change
    add_column :cabins, :office_id , :integer
  end
end
