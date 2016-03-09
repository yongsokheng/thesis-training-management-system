class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.references :task, index: true, foreign_key: true
      t.references :user_subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :progress
      t.integer :spent_time
      t.integer :status

      t.timestamps null: false
    end
  end
end
