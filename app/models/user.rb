class User < ApplicationRecord
    # presence: 存在性の有無
    # length: 長さの制限
    # format: 正規表現での制限
    # uniqueness: 一意性
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50}
    validates :email, presence: true, length: { maximum: 255},
        format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :password, presence: true, length: { minimum: 6}
    has_secure_password
end
