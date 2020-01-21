class UsersController < ApplicationController
  PER = 3

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(PER).order("created_at DESC").by_month
    @totaltime_paperworktime = @events.sum(:paperworktime)
    @totaltime_lessontime = @events.sum(:lessontime)
    @totaltime_trainingtime = @events.sum(:trainingtime)
    @totaltime_worktime = @events.sum(:worktime)
    @totaltime_breaktime = @events.sum(:breaktime)
    @total_travel_expenses = @events.sum(:travel_expenses)
    @totaltime_paperworktime_hour = @totaltime_paperworktime / 60
    @totaltime_lessontime_hour = @totaltime_lessontime / 60.round(2)
    @totaltime_training_hour = @totaltime_trainingtime / 60.round(2)
    @totaltime_worktime_hour = @totaltime_worktime / 60.round(2)
    @totaltime_breaktime_hour = @totaltime_breaktime / 60.round(2)
  end

  def index
  end
end
