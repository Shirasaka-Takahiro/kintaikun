class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @totaltime_paperworktime = Event.sum(:paperworktime)
    @totaltime_lessontime = Event.sum("@user.events")
    @totaltime_trainingtime = Event.sum("@user.events")
    @totaltime_worktime = Event.sum("@user.events")
    @totaltime_breaktime = Event.sum("@user.events")
    @total_travel_expenses = Event.sum("@user.events")
  end

  def index
  end
end
