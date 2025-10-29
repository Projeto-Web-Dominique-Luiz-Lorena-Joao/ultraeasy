class Address < ApplicationRecord
  has_many :patients, dependent: :restrict_with_error
  
  validates :street, :city, :state, :country, presence: true

  def full_address
    "#{street}, #{number} - #{neighborhood} - #{city}/#{state}"
  end
end
