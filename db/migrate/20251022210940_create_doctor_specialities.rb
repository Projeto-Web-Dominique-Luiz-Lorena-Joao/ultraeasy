class CreateDoctorSpecialities < ActiveRecord::Migration[8.0]
  def change
    create_table :doctor_specialities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :speciality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
