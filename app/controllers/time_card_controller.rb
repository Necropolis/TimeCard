require 'pp'

class TimeCardController < ApplicationController
  
  def index
    if params[:timecard]
      @weekly_totals = []
      params[:timecard].values.each do |week|
        week_total = Rational(0/1)
        week.values.each do |day|
          week_total = week_total + (DateTime.parse(day[:end])-DateTime.parse(day[:begin]))
        end
        @weekly_totals<<week_total
      end
      @month_total = Rational(0/1)
      @weekly_totals.map{|w|@month_total=@month_total+w}
      @calculated=true
    end
    @caculated||=false
  end

end
