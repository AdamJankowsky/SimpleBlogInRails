class User < ApplicationRecord



    validates :name, :email, presence: true
    validates :email, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }

end
