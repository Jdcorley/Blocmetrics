class CreateRegisteredApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.references :user 

      t.timestamps
    end
  end
end
