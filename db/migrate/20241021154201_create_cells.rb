class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells, id: :uuid do |t|
      t.string :cell_name, null: false
      t.text :cell_decription
      t.datetime :create_date
      t.string :created_by
      t.string :last_updated_by
      t.timestamps
    end
  end
end
