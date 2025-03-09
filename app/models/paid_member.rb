class PaidMember < ApplicationRecord
  belongs_to :admin_user
  belongs_to :cell
  belongs_to :financial_report
end
