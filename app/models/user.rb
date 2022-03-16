class User < ActiveRecord::Base
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length:{in: 6..15}
    validates :password_confirmation, length:{in: 6..15}
end
