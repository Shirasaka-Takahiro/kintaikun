class AddBreakTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :break_time, :datetime
  end
end
