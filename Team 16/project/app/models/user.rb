class User < ApplicationRecord
  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'username can only contain letters and numbers.' }
  validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'password can only contain letters and numbers.' }
  validates :user_type, presence: true

  has_many :activities
end
