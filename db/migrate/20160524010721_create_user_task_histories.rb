class CreateUserTaskHistories < ActiveRecord::Migration
  def change
    create_table :user_task_histories do |t|
      t.float :spent_time
      t.float :estimated_time
      t.integer :status, default: 0
      t.timestamps null: false

      t.references :user_task, index: true, foreign_key: {on_delete: :cascade}
    end
  end
end
