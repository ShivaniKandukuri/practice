class AddColumnAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :addrees , :string
  end
end
