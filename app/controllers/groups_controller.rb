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

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to groups_path
  end
end
