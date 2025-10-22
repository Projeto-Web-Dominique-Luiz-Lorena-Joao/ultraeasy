class Speciality < ApplicationRecord
  has_many :doctor_specialities, dependent: :destroy
  has_many :users, through: :doctor_specialities

  validates :name, presence: true, uniqueness: true
end