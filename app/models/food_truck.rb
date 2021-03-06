class FoodTruck < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
