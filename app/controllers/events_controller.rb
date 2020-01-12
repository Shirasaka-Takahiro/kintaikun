class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
    @event = Event.find_by(params[:id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def new
    @event = Event.new
    @events = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_param)

    if @event.save
      redirect_to events_path
      flash[:notice] = "#{current_user.username}さんが#{@event.title}を登録しました。"
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "#{@event.title}を削除しました。"
    redirect_to events_path
  end

  private

  def event_param
    params.require(:event).permit(:title, :description)
  end

end
