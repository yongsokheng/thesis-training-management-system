class CreateUserProgresses < ActiveRecord::Migration
  def change
    create_table :user_progresses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
