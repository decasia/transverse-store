class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    # let users look up their own user info without having to know their own id
    if params[:self]
      render json: current_user
    else
      @users = User.where group_id: current_user.current_group_id
      render jsonapi: @users
    end
  end

  def show
    @user = User.find params[:id]
    authorize! :show, @user
    render jsonapi: @user
  end

end
