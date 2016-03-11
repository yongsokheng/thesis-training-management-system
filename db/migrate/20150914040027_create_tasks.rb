class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :task_master_id
      t.references :course_subject, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
