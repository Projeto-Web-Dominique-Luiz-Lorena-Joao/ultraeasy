class CreateDoctorCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :doctor_companies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
