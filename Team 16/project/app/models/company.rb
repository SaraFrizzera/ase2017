class Company < ApplicationRecord
  validates :company_name, presence: true # TODO: add format company_name
  validates :vat_number, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'vat_number can only contain letters and numbers.' }

  has_many :activities
end
