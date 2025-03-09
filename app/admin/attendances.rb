ActiveAdmin.register Attendance do

  permit_params :cell_actviity_id,:from,:to,:created_by,:updated_by,sessions_attributes: [:id,:attendance_id,:starting_date,:ending_date,:session_title,:created_by,:updated_by, :_destroy]

  index do
    selectable_column
    
    column :attendance_title
    column "From", sortable: true do |c|
      c.from.strftime("%b %d, %Y")
    end
    column "To", sortable: true do |c|
      c.to.strftime("%b %d, %Y")
    end
    column "To", sortable: true do |c|
      c.sessions.count
    end
    actions
  end 

  form do |f|
    f.semantic_errors
    if !(params[:page_name] == "add") && (current_admin_user.role == "admin")
      f.inputs "Attendance information" do
        f.input :attendance_title
        
        f.input :cell_actviity_id, as: :search_select, url: admin_cell_cell_activities_path,
              fields: [:title, :id], display_name: 'title', minimum_input_length: 2,lebel: "title",
              order_by: 'id_asc'
        f.input :from, as: :date_time_picker
        f.input :to, as: :date_time_picker
        f.input :created_at, as: :date_time_picker
        if f.object.new_record?
          f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        else
          f.input :updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        end
      end
    else
      if f.object.sessions.empty?
        f.object.sessions << Session.new
      end
      panel "Session Information" do
        f.has_many :sessions,heading: " ", remote: true, allow_destroy: true, new_record: true do |a|
          # a.input :attendance_id, as: :search_select, url: admin_attendances_path,
          # fields: [:attendance_title, :id], display_name: 'attendance_title', minimum_input_length: 2,
          # order_by: 'id_asc'
          a.input :session_title
          a.input :starting_date, as: :date_time_picker 
          a.input :ending_date, as: :date_time_picker 
          # a.input :session_title
          
          if a.object.new_record?
            a.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
          else
            a.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
          end 
          a.label :_destroy
        end
      end
    end
    f.actions
  end

  action_item :edit, only: :show, priority: 0 do
    link_to 'Add Session', edit_admin_attendance_path(attendance.id, page_name: "add")
  end

  show title: :attendance_title do
    tabs do
      tab "Attendance Information" do
        columns do
          column max_width: "37%" do
            panel "Attendance information" do
              attributes_table_for attendance do
                row :attendance_title
                row :cell_activity do |pr|
                  pr.cell_activity.title
                end
                row :from
                row :to
                row :created_by
                row :updated_by
                row :created_at
                row :updated_at
              end
            end
          end
          column min_width: "60%" do
            panel "Attendance Session" do
              table_for attendance.sessions do
                column :session_title
                column :starting_date
                column :ending_date
                column :created_at
                column "links" do |c|
                  "#{link_to("Take Attendance", edit_admin_session_path(c, page_name: "add"))}".html_safe
                end
              end
            end 
          end 
        end
      end
      tab "users List" do
        panel "user List" do
          table_for CellMebmber.where(cell_id: attendance.cell_activity.cell) do
          
            column :student_full_name
            column "Cell Mebmber" do |s|
              s.admin_user.name.full 
            end
            column :total_session do |section|
              attendance.sessions.count
            end
            column :total_present_days do |section|
              attendance.sessions.map {|session| session.student_attendances.where(admin_user_id: section.admin_user, present: true).count}.sum
              # section.student.student_attendances.where(present: true).count
            end
            column :total_absent_days do |section|
              attendance.sessions.map {|session| session.student_attendances.where(admin_user_id: section.admin_user, absent: true).count}.sum
            end
            # column :avg_present_days do |section|
            #   span ((attendance.sessions.map {|session| session.student_attendances.where(student_id: section.student, present: true).count}.sum).to_i / attendance.sessions.count.to_i)
            # end
            # column :ending_date
            # column :created_at
          end
        end 
      end
      tab "Attendance Report" do
      end
    end
    
  end

  
end
