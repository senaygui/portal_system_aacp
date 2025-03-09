ActiveAdmin.register AdminUser, as: "FamilyMebmber"  do
  if proc {current_admin_user.role == "admin"}
  menu :if => false
end
menu priority: 2
permit_params :photo,:email, :password, :password_confirmation,:first_name,:last_name,:middle_name,:role,:username,:gender,:age,:date_of_birth,:ethnic_group,:education_level,:field_of_ftudy,:subcity,:woreda,:phone_number,:source_of_livelihood,:work_place,:position,:birth_place_region,:supporter_start_year,:basic_organization,:membership_monthly_fee_cash,:membership_start_year,:family_name

active_admin_import
controller do
  def update_resource(object, attributes)
    update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
    object.send(update_method, *attributes)
  end
end
index do
  selectable_column
  
  column "full name", sortable: true do |n|
    n.name.full 
  end
  column :email
  column :role
  column :current_sign_in_at
  column :sign_in_count
  column :created_at
  actions
end

filter :first_name
filter :last_name
filter :middle_name
filter :role
filter :email
filter :current_sign_in_at
filter :sign_in_count
filter :created_at

scope :recently_added
scope :total_users
scope :admins

# scope "ፋይናንስ ዘርፍ",:president
# scope "አደረጃጀት",:vice_presidents
# scope "presidentd name",:quality_assurances
# scope "presidentd name",:deans
# scope "presidentc name",:department_heads
# scope "presidentca name",:program_offices
# scope "presidentcs name",:library
# scope "presidentcd name",:registrars
# scope "presidentx name",:finances



form title: "User Account" do |f|
  f.inputs "User Account" do
    f.input :first_name
    f.input :last_name
    f.input :middle_name
    f.input :username
    f.input :email
    if !f.object.new_record?
      f.input :current_password
    end
    f.input :password
    f.input :password_confirmation
    
    f.input :role,  :as => :select, :collection => [["Admin","admin"],["Family Member","member"],["Finance Officer","finance_officer"],["Family Administrator","cell_administrator"], ["Family Politics Administrator","cell_politics_administrator"], ["Family Leader","cell_leader"]]
    f.input :cell_id, as: :search_select, url: admin_families_path,
        fields: [:cell_name, :id], display_name: 'cell_name', minimum_input_length: 2,
        order_by: 'id_asc', label: "family"
    f.input :photo, as: :file
    f.input :gender
    f.input :age
    f.input :date_of_birth, as: :date_time_picker
    f.input :ethnic_group
    f.input :education_level
    f.input :field_of_ftudy
    f.input :subcity
    f.input :woreda
    f.input :phone_number
    f.input :source_of_livelihood
    f.input :work_place
    f.input :position
    f.input :birth_place_region
    f.input :supporter_start_year, as: :date_time_picker
    f.input :basic_organization
    f.input :membership_monthly_fee_cash
    f.input :membership_start_year, as: :date_time_picker
    # f.input :family_name
  end
  f.actions
end

show :title => proc{|admin_user| admin_user.name.full }  do
  panel "Instructor Information" do
    attributes_table_for family_mebmber do
      row "photo" do |pt|
        span image_tag(pt.photo, size: '150x150', class: "img-corner") if pt.photo.attached?
      end
      row :first_name
      row :last_name
      row :middle_name
      row :username
      row :email
      row :gender
      row :age
      row :date_of_birth
      row :ethnic_group
      row :education_level
      row :field_of_ftudy
      row :subcity
      row :woreda
      row :phone_number
      row :source_of_livelihood
      row :work_place
      row :position
      row :birth_place_region
      row :supporter_start_year, as: :date_time_picker
      row :basic_organization
      row :membership_monthly_fee_cash
      row :membership_start_year, as: :date_time_picker
      row :family_name
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end
end 

end
