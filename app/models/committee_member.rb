class CommitteeMember < ApplicationRecord
  belongs_to :admin_user
  belongs_to :committee
end
