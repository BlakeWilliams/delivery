class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
    redirect_to(groups_path) and return if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, notice: 'Thank you for signing up.'
    else
      render :new
    end
  end
end
