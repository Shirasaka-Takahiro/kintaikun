require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(title description start_time end_time paperworktime lessontime trainingtime worktime breaktime travel_expenses)
  csv << csv_column_names
  @events.each do |events|
    column_values = [
        events.title,
        events.description,
        events.start_time,
        events.end_time,
        events.paperworktime,
        events.lessontime,
        events.trainingtime,
        events.worktime,
        events.breaktime,
        events.travel_expenses
    ]
    csv << column_values
  end
end