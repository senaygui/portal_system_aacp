class AddAttrubitesToCellMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :gender,  :string
    add_column :admin_users, :age,  :string
    add_column :admin_users, :date_of_birth,  :datetime
    add_column :admin_users, :ethnic_group,  :string
    add_column :admin_users, :education_level,  :string
    add_column :admin_users, :field_of_ftudy, :string
    add_column :admin_users, :subcity,  :string
    add_column :admin_users, :woreda,  :string

    add_column :admin_users, :phone_number,  :string
    add_column :admin_users, :source_of_livelihood, :string
    add_column :admin_users, :work_place,  :string
    add_column :admin_users, :position,  :string
    add_column :admin_users, :birth_place_region,  :string
    add_column :admin_users, :supporter_start_year,  :datetime
    add_column :admin_users, :basic_organization,  :string
    add_column :admin_users, :membership_monthly_fee_cash,  :decimal
    add_column :admin_users, :membership_start_year,  :datetime
    add_column :admin_users, :family_name, :string
    
  end
end
