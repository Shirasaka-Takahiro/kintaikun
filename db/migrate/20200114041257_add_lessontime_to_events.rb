class AddLessontimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :lessontime, :integer
  end
end
