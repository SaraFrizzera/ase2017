class Activity < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :company
  belongs_to :user
end
