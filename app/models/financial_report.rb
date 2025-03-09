class FinancialReport < ApplicationRecord
  after_create :add_paid_member
  ##associations
    belongs_to :admin_user
    belongs_to :cell
    has_many :paid_members, dependent: :destroy


    def generate_report(current_user_id)
      self.create do |report|
        report.admin_user_id = current_user_id
        report.cell_id = current_user_id.cell
        report.current_balance = 0.0
        report.previous_balance = FinancialReport.where(cell_id: current_user_id.cell).last
        report.financial_report_date = Time.now
        report.created_by = self.created_by
      end
    end

    # def add_paid_member
		# 	AdminUser.where(cell_id: self.cell).where(active_status: "active").each do |member|
		# 		PaidMember.create do |user|
    #       user.admin_user_id = member.id
    #       user.cell_id = self.cell_id
    #       user.financial_report_id = self.id
    #       if member.salary < 1000
    #         user.fee_precentage = 0.002
    #         user.paid_amount = member.salary * 0.002
		# 			elsif member.salary => 1001 && member.salary =< 2000
    #         user.fee_precentage = 0.003
    #         user.paid_amount = member.salary * 0.003
		# 			elsif member.salary => 2001 && member.salary =< 3000
    #         user.fee_precentage = 0.004
    #         user.paid_amount = member.salary * 0.004
    #       elsif member.salary => 3001 && member.salary =< 4000
    #         user.fee_precentage = 0.006
    #         user.paid_amount = member.salary * 0.006
    #       elsif member.salary => 4001 && member.salary =< 5000
    #         user.fee_precentage = 0.008
    #         user.paid_amount = member.salary * 0.008
    #       elsif member.salary => 5001 && member.salary =< 6000
    #         user.fee_precentage = 0.01
    #         user.paid_amount = member.salary * 0.01
    #       elsif member.salary => 6001 && member.salary =< 7000
    #         user.fee_precentage = 0.012
    #         user.paid_amount = member.salary * 0.012
    #       elsif member.salary => 7001 && member.salary =< 8000
    #         user.fee_precentage = 0.014
    #         user.paid_amount = member.salary * 0.014
    #       elsif member.salary => 8001 && member.salary =< 9000
    #         user.fee_precentage = 0.016
    #         user.paid_amount = member.salary * 0.016
    #       elsif member.salary => 9001 && member.salary =< 10000
    #         user.fee_precentage = 0.018
    #         user.paid_amount = member.salary * 0.018
    #       elsif member.salary => 10000
    #         user.fee_precentage = 0.02
    #         user.paid_amount = member.salary * 0.02
		# 			end
          
		# 			user.created_by = self.created_by
		# 		end
		# 	end
    #   self.update_columns(current_balance: self.paid_members.collect { |oi| oi.valid? ? (oi.paid_amount) : 0 }.sum)
		# end
end
