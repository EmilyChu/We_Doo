class Availability < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
  
end
