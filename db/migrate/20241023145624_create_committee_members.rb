class CreateCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :committee_members, id: :uuid do |t|
      t.belongs_to :admin_user, foreign_key: true, index: true, type: :uuid
      t.belongs_to :committee, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
