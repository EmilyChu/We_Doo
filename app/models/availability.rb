class Availability < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar attr_accessor :start_time

  def starts_at
    self.start_at
  end

end
