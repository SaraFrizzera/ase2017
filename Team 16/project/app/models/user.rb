class User < ApplicationRecord
  validates :id
  validates :name, length: { minimum: 2, maximum: 500 }, presence: true
end
