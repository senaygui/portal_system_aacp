class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions, id: :uuid do |t|
      t.belongs_to :attendance, index: true, type: :uuid
      t.datetime :starting_date
      t.datetime :ending_date
      t.string :session_title
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
