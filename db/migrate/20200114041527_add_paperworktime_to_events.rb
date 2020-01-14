class AddPaperworktimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :paperworktime, :integer
  end
end
