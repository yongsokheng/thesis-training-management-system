class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.date :report_date
      t.integer :working_duration
      t.integer :lines_code
      t.timestamps null: false
    end
  end
end
