class AuthenticationController < ApplicationController

  def password
    if params[:username] && params[:password]
      user = User.find_by username: params[:username]
      if user and user.authenticate(params[:password])
        set_session user.username
        render json: current_user
      else
        clear_session
        render json: {error: "Unauthorized"}, status: 401
      end
    else
      # TODO: render params notice
      clear_session
      render json: {error: "Invalid parameters"}, status: 400
    end
  end

  # TODO handle LTI auth
  def lti

  end

  protected

  def set_session(username)
    session[:username] = username
  end

  def clear_session
    session[:username] = nil
    session[:group_id] = nil
  end
end
