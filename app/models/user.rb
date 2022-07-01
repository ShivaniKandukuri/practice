class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles
  has_one :magazine
  validates :name, presence: true,
                   uniqueness:{case_sensitive: false},
                   length: {minimun:3,maximum:25}
  validates :email, presence: true,
                    uniqueness:{case_sensitive: false},
                    length: {maximum:105},
                    format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/i}
   has_secure_password
end
