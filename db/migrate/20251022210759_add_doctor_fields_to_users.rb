class AddDoctorFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mln, :string
    add_column :users, :phone, :string
  end
end
