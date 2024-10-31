class Committee < ApplicationRecord
  belongs_to :admin_user
  has_many :committee_members
  accepts_nested_attributes_for :committee_members, reject_if: :all_blank, allow_destroy: true
end
