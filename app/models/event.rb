class Event < ApplicationRecord
  belongs_to :preference
  has_many :comments, dependent: :destroy
end
