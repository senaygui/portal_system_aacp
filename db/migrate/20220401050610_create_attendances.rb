class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances, id: :uuid do |t|
      t.belongs_to :cell_activity, index: true, type: :uuid
      t.string :attendance_title
      t.datetime :from
      t.datetime :to
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
