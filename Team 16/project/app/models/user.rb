class User < ApplicationRecord
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :password, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
end
