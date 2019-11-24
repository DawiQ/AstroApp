class User < ApplicationRecord
  acts_as_token_authenticatable
  has_and_belongs_to_many :preferences
  has_many :comments, dependent: :destroy
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name
end
