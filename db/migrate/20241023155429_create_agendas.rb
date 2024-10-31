class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas, id: :uuid do |t|
      t.belongs_to :cell_activity, foreign_key: true, index: true, type: :uuid
      t.string :agenda_title, null: false
      t.text :agenda_description, null: false
      t.string :created_by
      t.string :last_updated_by
      t.timestamps
    end
  end
end
