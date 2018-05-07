class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string  :name, null: false, default: "" 
      t.string  :url, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
