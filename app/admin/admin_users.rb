ActiveAdmin.register AdminUser do
  if proc {current_admin_user.role == "admin"}
    menu :if => false
  end
  active_admin_import
  menu priority: 2
  permit_params :photo,:email, :password, :password_confirmation,:first_name,:last_name,:middle_name,:role,:username
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

  # filter :first_name, label: ""
  filter :last_name
  filter :middle_name
  filter :role
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  scope :recently_added
  scope :total_users
  # scope :admins
  
  # scope "መሰረታዊ ፓርቲ", :president

  # scope "ፋይናንስ ዘርፍ", :vice_presidents

  # scope "አደረጃጀት", :quality_assurances
  
  # scope "ፖለቲካ ዘርፍ", :deans
  # scope "ሰብሳቢ", :department_heads
  
  
  

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
    end
    f.actions
  end

  show :title => proc{|admin_user| admin_user.name.full }  do
    panel "User Information" do
      attributes_table_for admin_user do
        row "photo" do |pt|
          span image_tag(pt.photo, size: '150x150', class: "img-corner") if pt.photo.attached?
        end
        row :first_name
        row :last_name
        row :middle_name
        row :username
        row :role
        row :email
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
