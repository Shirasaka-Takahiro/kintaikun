class UsersController < ApplicationController
  PER = 5

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(PER).order("created_at DESC")
    @totaltime_paperworktime = @events.sum(:paperworktime)
    @totaltime_lessontime = @events.sum(:lessontime)
    @totaltime_trainingtime = @events.sum(:trainingtime)
    @totaltime_worktime = @events.sum(:worktime)
    @totaltime_breaktime = @events.sum(:breaktime)
    @total_travel_expenses = @events.sum(:travel_expenses)
  end

  def index
  end
end
