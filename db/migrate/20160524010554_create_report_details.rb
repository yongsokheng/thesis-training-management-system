class CreateReportDetails < ActiveRecord::Migration
  def change
    create_table :report_details do |t|
      t.references :report, index: true, foreign_key: true
      t.references :user_task, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
