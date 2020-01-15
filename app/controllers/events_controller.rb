class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  PER = 5

  def index
    @events = Event.page(params[:page]).per(PER)
    @totaltime_paperworktime = Event.all.sum(:paperworktime)
    @totaltime_lessontime = Event.all.sum(:lessontime)
    @totaltime_trainingtime = Event.all.sum(:trainingtime)
    @totaltime_worktime = Event.all.sum(:worktime)
    @totaltime_breaktime = Event.all.sum(:breaktime)
    @total_travel_expenses = Event.all.sum(:travel_expenses)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_url
      flash[:notice] = "#{@event.title}を登録しました。"
    else
      render :new
    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "#{@event.title}を削除しました。"
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :worktime, :lessontime, 
    :paperworktime, :trainingtime, :breaktime, :travel_expenses, :description)
  end

end
