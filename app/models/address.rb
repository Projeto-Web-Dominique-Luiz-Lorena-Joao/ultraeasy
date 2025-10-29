class Address < ApplicationRecord
  has_many :patients, dependent: :restrict_with_error

  validates :street, :city, :state, :country, presence: true
end
