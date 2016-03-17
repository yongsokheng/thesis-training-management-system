class CreateGroupSubjects < ActiveRecord::Migration
  def change
    create_table :group_subjects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
