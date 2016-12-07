class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :user_task, index: true, foreign_key: true

      t.timestamps
    end
  end
end
