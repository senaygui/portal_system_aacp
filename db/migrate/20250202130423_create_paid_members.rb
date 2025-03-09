class CreatePaidMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :paid_members, id: :uuid do |t|
      t.belongs_to :admin_user, foreign_key: true, index: true, type: :uuid
      t.belongs_to :cell, foreign_key: true, index: true, type: :uuid
      t.belongs_to :financial_report, foreign_key: true, index: true, type: :uuid
      t.decimal :paid_amount, null: false
      t.decimal :fee_precentage, null: false
      t.string :created_by
      t.string :last_updated_by

      t.timestamps
    end
  end
end
