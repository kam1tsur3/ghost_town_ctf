class Challenge < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :flag, presence: true
  validates :category, presence: true
end
