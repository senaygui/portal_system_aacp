class CreateCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :committees, id: :uuid do |t|
      t.string :committee_title, null: false
      t.text :committee_job_description, null: false
      t.datetime :committee_started_at, null: false
      t.belongs_to :admin_user, foreign_key: true, index: true, type: :uuid
      t.string :created_by
      t.string :last_updated_by
      t.timestamps
    end
  end
end
