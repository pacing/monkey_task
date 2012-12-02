class TodayController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :find_schedule
  def index
      @todos = @today.todos
  end
  protected
  def find_schedule
      @today = current_user.schedule||current_user.create_schedule(:today => Date.today.to_s)
  end
end
