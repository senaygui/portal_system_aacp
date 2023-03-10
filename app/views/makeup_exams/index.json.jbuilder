json.set! :data do
  json.array! @makeup_exams do |makeup_exam|
    json.partial! 'makeup_exams/makeup_exam', makeup_exam: makeup_exam
    json.url  "
              #{link_to 'Show', makeup_exam }
              #{link_to 'Edit', edit_makeup_exam_path(makeup_exam)}
              #{link_to 'Destroy', makeup_exam, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end