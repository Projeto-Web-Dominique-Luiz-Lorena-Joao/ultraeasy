class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :doctor_specialities, dependent: :destroy
  has_many :specialities, through: :doctor_specialities
  
  has_many :doctor_companies, dependent: :destroy
  has_many :companies, through: :doctor_companies

  validates :name, presence: true
  validates :mln, presence: true, uniqueness: true
  validates :phone, presence: true
end

