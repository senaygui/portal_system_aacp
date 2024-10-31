ActiveAdmin.register AdminUser do
  if proc {current_admin_user.role == "admin"}
    menu :if => false
  end
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
    
    column "ስም", sortable: true do |n|
      n.name.full 
    end
    column "ኢሜል", :email
    column "ሚና", :role
    column "አሁን የገቡበት",:current_sign_in_at
    column "የገቡበት በቁጥር", :sign_in_count
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
      f.input :first_name, label: "ስም"
      f.input :last_name, label: "አባት ስም"
      f.input :middle_name, label: "አያት ስም"
      f.input :username, label: "የተጠቃሚ ስም"
      f.input :email, label: "ኢሜል"
      if !f.object.new_record?
        f.input :current_password
      end
      f.input :password, label: "የይለፍ ቃል "
      f.input :password_confirmation, label: "የይለፍ ቃል ማረጋገጫ"
      
      f.input :role, label: "ሚና",  :as => :select, :collection => [["Admin","admin"],["መሰረታዊ ፓርቲ","መሰረታዊ ፓርቲ"],["ፋይናንስ ዘርፍ","ፋይናንስ ዘርፍ"],["አደረጃጀት","አደረጃጀት"], ["ፖለቲካ ዘርፍ","ፖለቲካ ዘርፍ"], ["ሰብሳቢ","ሰብሳቢ"]]
      f.input :cell_id,label: "የህዋስ ስም", as: :search_select, url: admin_cells_path,
          fields: [:cell_name, :id], display_name: 'cell_name', minimum_input_length: 2,
          order_by: 'id_asc'
      f.input :photo, as: :file, label: "ፎቶ"
    end
    f.actions
  end

  show :title => proc{|admin_user| admin_user.name.full }  do
    panel "Instructor Information" do
      attributes_table_for admin_user do
        row "photo" do |pt|
          span image_tag(pt.photo, size: '150x150', class: "img-corner") if pt.photo.attached?
        end
        row "ስም", :first_name
        row "አባት ስም", :last_name
        row "አያት ስም", :middle_name
        row "የተጠቃሚ ስም", :username
        row "ኢሜል", :email
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
