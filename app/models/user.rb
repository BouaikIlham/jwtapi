class User < ApplicationRecord
    has_secure_password
    has_many :books
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true

end
