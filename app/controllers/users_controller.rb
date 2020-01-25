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
    @totaltime_paperworktime_hour = sprintf("%.3f",@totaltime_paperworktime/60.to_f)
    @totaltime_lessontime_hour = sprintf("%.3f",@totaltime_lessontime/60.to_f)
    @totaltime_training_hour = sprintf("%.3f",@totaltime_trainingtime/60.to_f)
    @totaltime_worktime_hour = sprintf("%.3f",@totaltime_worktime/60.to_f)
    @totaltime_breaktime_hour = sprintf("%.3f",@totaltime_breaktime/60.to_f)
  end

  def index
  end
end
