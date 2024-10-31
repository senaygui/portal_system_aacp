ActiveAdmin.register Committee do

 permit_params :admin_user_id, :committee_title, :committee_job_description, :committee_started_at, :created_by,:last_updated_by, committee_members_attributes: [:id,:admin_user_id,:committee_id, :_destroy]
 active_admin_import
 index do
  selectable_column
  column :committee_title
  column "Username", sortable: true do |d|
    link_to d.admin_user.username, [:admin, d.admin_user]
  end
  column :committee_started_at, sortable: true do |c|
    c.committee_started_at.strftime("%b %d, %Y")
  end
  actions
end

# filter :program_id, as: :search_select_filter, url: proc { admin_programs_path },
# fields: [:program_name, :id], display_name: 'program_name', minimum_input_length: 2,
# order_by: 'id_asc'
# filter :curriculum_title
# filter :curriculum_version
# filter :total_course
# filter :total_ects
# filter :total_credit_hour
# filter :active_status
# filter :curriculum_active_date
# filter :depreciation_date
# filter :created_by
# filter :last_updated_by

# filter :created_at
# filter :updated_at

# scope :recently_added

  form do |f|
    f.semantic_errors
      f.inputs "Committee information" do
        f.input :committee_title
        f.input :committee_job_description
        f.input :committee_started_at, as: :date_time_picker 
        f.input :admin_user_id,label: "Committee Leader", as: :search_select, url: admin_admin_users_path,
        fields: [:username, :id], display_name: 'username', minimum_input_length: 2,
        order_by: 'id_asc'
        if f.object.new_record?
          f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        else
          f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        end      
      end
    
    if f.object.new_record?
      if f.object.committee_members.empty?
        f.object.committee_members << CommitteeMember.new
      end
      panel "Committee Member Information" do
        f.has_many :committee_members, heading: " ", remote: true, allow_destroy: true, new_record: true do |a|
          a.input :admin_user_id,label: "Committee Member", as: :search_select, url: admin_admin_users_path,
          fields: [:username, :id], display_name: 'username', minimum_input_length: 2,
          order_by: 'id_asc'
          a.label :_destroy
        end
      end
    end
    f.actions
  end

  show title: :committee_title do
    tabs do
      tab "Committee information" do
        columns do
          column do
            panel "Committee information" do
              attributes_table_for committee do
                row :committee_title
                row :committee_job_description
                row :committee_started_at
                row "Committee Leader" do |pr|
                  link_to pr.admin_user.username, admin_admin_user_path(pr.admin_user)
                end
                row :created_by
                row :last_updated_by
    
                row :created_at
                row :updated_at
              end
            end
          end
          column do
            panel "committee members" do
              table_for committee.committee_members.all do
                column "committee member" do |item|
                  link_to item.admin_user.username, admin_admin_user_path(item.admin_user)
                end
                column :created_at, sortable: true do |c|
                  c.created_at.strftime("%b %d, %Y")
                end
              end
            end
          end
        end
      end
    end
  end
end
