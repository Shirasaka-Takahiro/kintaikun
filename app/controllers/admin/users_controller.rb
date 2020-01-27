class Admin::UsersController < ApplicationController
  PER = 10

  def index
    @user = User.where.not(id: current_user.id).page(params[:page]).per(PER).order("created_at DESC").search(params[:search])
  end

  def show

  end

  def new
  end

  def edit
  end
end
