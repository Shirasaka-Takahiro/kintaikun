class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @events = Event.all
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
    params.require(:event).permit(:title, :description, :start_time,
     :end_time, :break_time, :break_time_end)
  end

end
