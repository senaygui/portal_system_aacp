class Cell < ApplicationRecord
  has_many :admin_users, dependent: :destroy
  has_many :cell_activities, dependent: :destroy
  has_many :financial_reports, dependent: :destroy
  has_many :paid_members, dependent: :destroy
end
