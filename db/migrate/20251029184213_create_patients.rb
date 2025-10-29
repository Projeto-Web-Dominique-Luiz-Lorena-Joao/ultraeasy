class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :phone
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
