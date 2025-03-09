ActiveAdmin.register CellActivity, as: "FamilyActivity" do

 permit_params :title,:overview,:cell_id,:category, :created_by,:last_updated_by, agendas_attributes: [:id,:cell_activity_id,:agenda_title,:agenda_description,:created_by,:last_updated_by, :_destroy],reports: [], galleries: []

 index do
  selectable_column
  column :title
  column :category
  column "family name", sortable: true do |d|
    link_to d.cell.cell_name, [:admin, d.cell]
  end
  column :created_at, sortable: true do |c|
    c.created_at.strftime("%b %d, %Y")
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
      f.inputs "Family Activity Information" do
        f.input :title
        f.input :category
        f.input :cell_id, as: :search_select, url: admin_families_path,
        fields: [:cell_name, :id], display_name: 'cell_name', minimum_input_length: 2,
        order_by: 'id_asc', label: "Family Name"
        f.input :overview
        if f.object.new_record?
          f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        else
          f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        end      
      end
    
    if f.object.new_record?
      if f.object.agendas.empty?
        f.object.agendas << Agenda.new
      end
      panel "Agenda Information" do
        f.has_many :agendas, heading: " ", remote: true, allow_destroy: true, new_record: true do |a|
          a.input :agenda_title
          a.input :agenda_description
          a.label :_destroy
        end
      end
    end
    f.inputs 'Upload File' do
      div class: "file-upload", multipart: true do
        f.label :reports, "Upload Report *", {class: "file-upload-label"}
        f.drag_and_drop_file_field :reports do
          'Drag and drop or click here to upload Report!'
        end 
      end
      div class: "file-upload", multipart: true do
        f.label :galleries, "upload photos *", {class: "file-upload-label"}
        f.drag_and_drop_file_field :galleries do
          'Drag and drop or click here to upload photos!'
        end 
      end
    end
    f.actions
  end

  show title: :title do
    tabs do
      tab "Family Activity Information" do
        columns do
          column do
            panel "Cell Activity Information" do
              attributes_table_for family_activity do
                row :title
                row :overview
                row :category
                row "Cell Name" do |pr|
                  link_to pr.cell.cell_name, admin_family_path(pr.cell)
                end
                row :created_by
                row :last_updated_by
                row :created_at
                row :updated_at
              end
            end
          end
          column do
            panel "Agendas" do
              table_for family_activity.agendas.all do
                column :agenda_title
                column :agenda_description
                column :created_by
                column :created_at, sortable: true do |c|
                  c.created_at.strftime("%b %d, %Y")
                end
              end
            end
          end
        end
        columns do
          column do
            panel "Galleries" do
              attributes_table_for family_activity do
                row "Documents" do |i|
                  div class: "document-preview container" do
                    i.galleries.each do |doc| 
                      
                      if doc.variable?
                        div class: "preview-card" do
                          span link_to image_tag(doc, size: '200x200'), doc
                        end
                      elsif doc.previewable?
                        div class: "preview-card" do
                          span link_to "view document", Rails.application.routes.url_helpers.rails_blob_path(doc, disposition: "attachment", only_path: true)
                        end
                      else
                        # span link_to "view document", doc.service_url
                      end
                    end
                  end
                end
              end
            end
          end
          column do
            panel "Report" do
              div class: "parent" do
                family_activity.reports.each do |doc| 
                  div class: "div1" do
                    figure do
                    span image_tag("file.jpg", width: "90")
                    figcaption do
                      strong "Report file"
                    end
                    end
                    # span link_to("<i class='fa-light fa fa-eye'></i>".html_safe, construction_permit.architectural_file, class: "")
                    a href: "#{rails_blob_path(doc, disposition: 'preview')}", class: "file-icon" do
                      i class: "fa-light fa fa-eye icon-color-view"
                    end
                    a href: "#{rails_blob_path(doc, disposition: "attachment")}", class: "file-icon" do
                      i class: " fa-solid fa fa-download icon-color-download"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
