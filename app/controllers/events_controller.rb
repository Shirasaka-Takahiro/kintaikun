class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  PER = 5

  def index
    @events = Event.all.page(params[:page]).per(PER).order("created_at DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(user_id: current_user.id)
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_url
      flash[:notice] = "#{@event.created_at}を登録しました。"
    else
      render :new
    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "#{@event.created_at}を削除しました。"
    redirect_to events_url
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = "#{@event.created_at}を編集しました。"
    redirect_to events_url
  end

  def import
    Event.import(params[:file])
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :worktime, :lessontime, 
    :paperworktime, :trainingtime, :breaktime, :travel_expenses, :description)
  end

end
