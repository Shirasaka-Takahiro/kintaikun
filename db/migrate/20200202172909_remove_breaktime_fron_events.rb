class RemoveBreaktimeFronEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :breaktime, :time  
  end
end
