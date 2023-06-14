class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :pictures
  enum status: {pending: 0, approved: 1, disapproved: 2}
  enum complaint_type: {concern: 0, appreciate: 1}
  validates :category_id, presence: true
  validates :pictures, presence: true
  validates :description, presence: true,length: {minimum: 3, maximum: 50}
  validates :complaint_type, presence: true
  # validates :reject_reason, presence: true,length: {minimum: 3, maximum: 50}
  validates :status, presence: true
end
