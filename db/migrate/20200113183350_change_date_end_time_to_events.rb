class ChangeDateEndTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :breaktime, :integer
  end
end
