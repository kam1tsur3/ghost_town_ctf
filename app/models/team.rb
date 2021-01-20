class Team < ApplicationRecord
  validates :name, 
    presence: true, 
    length: { maximum: 50}, 
    uniqueness: true
  validates :leader_id,
    presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
end
