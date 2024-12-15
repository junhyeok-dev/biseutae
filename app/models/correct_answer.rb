class CorrectAnswer < ApplicationRecord
  class << self
    def current_answer
      Rails.cache.fetch("todays_answer", expires_at: Date.today.end_of_day) do
        find_by(date: Date.today)
      end
    end
  end
end
