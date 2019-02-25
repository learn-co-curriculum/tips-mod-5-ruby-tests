require 'active_support'
require 'active_support/core_ext'
# require 'byebug'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    counter = 1
    while current <= date
      if current == date
        return true
      end
      # puts counter
      # puts current
      # puts @period
      # # puts date
      #
      # puts '-------'
      if @period == 'monthly'
        current = @start.advance(months: @interval * counter )
      elsif @period == 'weekly'
        current = @start.advance(weeks: @interval * counter )
      elsif @period == 'daily'
        current = @start.advance(days: @interval * counter )
      end
      counter += 1
    end
    return false
  end
end
