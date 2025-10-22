class Company < ApplicationRecord
  has_many :doctor_companies, dependent: :destroy
  has_many :users, through: :doctor_companies

  validates :name, presence: true
  validates :ein, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end