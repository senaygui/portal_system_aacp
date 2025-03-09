class Attendance < ApplicationRecord

  belongs_to :cell_activity
  has_many :sessions, dependent: :destroy
  accepts_nested_attributes_for :sessions, reject_if: :all_blank, allow_destroy: true

  ##scope
    scope :recently_added, lambda { where('created_at >= ?', 1.week.ago)}
  
end
