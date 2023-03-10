json.set! :data do
  json.array! @withdrawals do |withdrawal|
    json.partial! 'withdrawals/withdrawal', withdrawal: withdrawal
    json.url  "
              #{link_to 'Show', withdrawal }
              #{link_to 'Edit', edit_withdrawal_path(withdrawal)}
              #{link_to 'Destroy', withdrawal, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end