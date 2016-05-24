class CreateUserTaskHistories < ActiveRecord::Migration
  def change
    create_table :user_task_histories do |t|
      t.references :user_task, index: true, foreign_key: true
      t.integer :spent_time
      t.integer :estimated_time
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
