class ChangeDateEndTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :breaktime, 'integer USING CAST(worktime AS integer)'
  end
end
