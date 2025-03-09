ActiveAdmin.register Cell, as: "family" do
  permit_params :cell_name
  index do
    selectable_column
    column :cell_name
    column "Created At", sortable: true do |c|
      c.created_at.strftime("%b %d, %Y")
    end
    actions
  end

  filter :cell_name
  filter :created_by
  filter :last_updated_by
  filter :created_at
  filter :updated_at

  form title: "Family Information" do |f|
    f.semantic_errors
    f.inputs "Family Information" do
      f.input :cell_name, label: "Family Name"
      f.input :cell_decription, label: "Family Description"
      f.input :create_date, as: :date_time_picker     
    end
    if f.object.new_record?
      f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
    else
      f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
    end 
    f.actions
  end

  show title: :cell_name do
    panel "Family  information" do
      attributes_table_for cell do
        row :cell_name
        row :created_at
        row :updated_at
      end
    end
  end

end
