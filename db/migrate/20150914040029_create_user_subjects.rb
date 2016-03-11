class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.integer :status, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.references :user_course, index: true, foreign_key: true
      t.references :course_subject, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
