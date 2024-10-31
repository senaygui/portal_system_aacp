class Cell < ApplicationRecord
  has_many :admin_users, dependent: :destroy
  has_many :cell_activities, dependent: :destroy
end
