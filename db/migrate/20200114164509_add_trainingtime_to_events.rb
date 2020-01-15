class AddTrainingtimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :trainingtime, :integer
  end
end
