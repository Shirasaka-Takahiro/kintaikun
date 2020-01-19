class Event < ApplicationRecord
    belongs_to :user

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            event = find_by(id: row["id"]) || new
            event.attributes = row.to_hash.slice(*updatable_attributes)
            event.save
        end
    end

    def self.updatable_attributes
        ["title", "description", "start_time", "end_time", "paperworktime", "lessontime", "trainingtime", "worktime", "breaktime", "travel_expenses"]
    end

end
