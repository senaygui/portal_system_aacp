class StudentAttendance < ApplicationRecord
  belongs_to :session
  belongs_to :admin_user
end
