class AddBreakTimeEndToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :break_time_end, :datetime
  end
end
