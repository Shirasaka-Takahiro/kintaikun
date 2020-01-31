class RemoveWorktimeFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :worktime, :date
  end
end
