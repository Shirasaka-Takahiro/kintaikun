class ChangeDateStartTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :worktime, 'integer USING CAST(worktime AS integer)'
  end
end
