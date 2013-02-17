class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @email = Email.new
  end

  def create
    @group = Group.new(params[:group])
    @group.user = current_user

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
end
