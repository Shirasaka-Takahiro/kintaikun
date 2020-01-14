class AddTravelExpensesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :travel_expenses, :integer
  end
end
