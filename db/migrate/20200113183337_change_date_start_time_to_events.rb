class ChangeDateStartTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :worktime, :integer
  end
end
