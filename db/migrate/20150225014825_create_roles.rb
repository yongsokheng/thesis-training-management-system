class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :allow_access_admin

      t.timestamps null: false
    end
  end
end
