class AddRegisteredApplicationIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :registered_application, index: true 
  end
end
