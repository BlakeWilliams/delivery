class EmailsController < ApplicationController
  before_filter :find_group

  def create
    @email = Email.new(params[:email])
    @email.group = @group

    if @email.save
      redirect_to @group
    else
      render 'group/new'
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    redirect_to @group
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end
end
