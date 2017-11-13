class Company < ApplicationRecord
  validates :company_name, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'company_name can only contain letters and numbers.' }
  validates :vat_number, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'vat_number can only contain letters and numbers.' }
end
