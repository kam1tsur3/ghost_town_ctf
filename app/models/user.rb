class User < ApplicationRecord
    # presence: 存在性の有無
    # length: 長さの制限
    # format: 正規表現での制限
    # uniqueness: 一意性
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50}
    validates :email, presence: true, length: { maximum: 255},
        format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :password, presence: true, length: { minimum: 6}
    has_secure_password

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
            BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        # remember_digest はself.remember_digestと同義であり、ActiveRecodeの場合このような記法でDBから取り出すことができる
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
