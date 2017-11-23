class Activity < ApplicationRecord
  validates :username, presence: true
  validates :company_vat_number, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :company
  belongs_to :user
end
