class DoctorSpeciality < ApplicationRecord
  belongs_to :user
  belongs_to :speciality

  validates :user_id, uniqueness: { scope: :speciality_id }
end