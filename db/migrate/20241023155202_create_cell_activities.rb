class CreateCellActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :cell_activities, id: :uuid do |t|
      t.string :title, null: false
      t.text :overview, null: false
      t.belongs_to :cell, foreign_key: true, foreign_key: true, index: true, type: :uuid
      t.string :category, null: false
      t.string :created_by
      t.string :last_updated_by
      t.timestamps
    end
  end
end
