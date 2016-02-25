class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.date :start_training_date
      t.date :leave_date
      t.date :finish_training_date
      t.boolean :ready_for_project
      t.date :contract_date
      t.string :naitei_company
      t.integer :trainer_id
      t.date :graduation
      t.timestamps null: false
    end
  end
end
