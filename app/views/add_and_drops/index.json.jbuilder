json.set! :data do
  json.array! @add_and_drops do |add_and_drop|
    json.partial! 'add_and_drops/add_and_drop', add_and_drop: add_and_drop
    json.url  "
              #{link_to 'Show', add_and_drop }
              #{link_to 'Edit', edit_add_and_drop_path(add_and_drop)}
              #{link_to 'Destroy', add_and_drop, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end