class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.string :subject_name
      t.text :subject_description
      t.text :subject_content
      t.string :image
      t.integer :order
      t.integer :sort_order, :default => RankedModel::MAX_RANK_VALUE
      t.references :subject, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
