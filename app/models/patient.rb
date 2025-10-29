class Patient < ApplicationRecord
  belongs_to :address

  validates :name, :email, :birthdate, presence: true
  validates :email, uniqueness: true
end
