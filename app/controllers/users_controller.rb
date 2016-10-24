class UsersController < ApplicationController

  before_action :authenticate_user

  def index
    # let users look up their own user info without having to know their own id
    if params[:self]
      render json: current_user
    else
      # TODO load only members of current group
      @users = User.all
      render jsonapi: @users
    end
  end

  def show
    @user = User.find params[:id]
    render jsonapi: @user
  end

end
