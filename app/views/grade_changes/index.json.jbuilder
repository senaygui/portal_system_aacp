json.set! :data do
  json.array! @grade_changes do |grade_change|
    json.partial! 'grade_changes/grade_change', grade_change: grade_change
    json.url  "
              #{link_to 'Show', grade_change }
              #{link_to 'Edit', edit_grade_change_path(grade_change)}
              #{link_to 'Destroy', grade_change, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end