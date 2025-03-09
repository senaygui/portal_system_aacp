class CreateFinancialReports < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_reports, id: :uuid do |t|
      t.belongs_to :admin_user, foreign_key: true, index: true, type: :uuid
      t.belongs_to :cell, foreign_key: true, index: true, type: :uuid
      t.decimal :current_balance, null: false
      t.decimal :previous_balance, null: false
      t.integer :total_members, null: false
      t.datetime :financial_report_date, null: false
      t.string :created_by, null: false
      t.string :last_updated_by

      t.timestamps
    end
  end
end
