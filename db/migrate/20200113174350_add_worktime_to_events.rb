class AddWorktimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :worktime, :datetime
  end
end
