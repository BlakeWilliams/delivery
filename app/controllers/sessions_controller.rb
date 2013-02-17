class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to root_path, notice: 'You have been logged in'
    else
      render :new
    end
  end
end
