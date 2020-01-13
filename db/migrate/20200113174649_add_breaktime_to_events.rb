class AddBreaktimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :breaktime, :time
  end
end
