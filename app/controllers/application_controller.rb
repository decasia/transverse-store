class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def current_user
    return nil unless session.has_key? :username

    user = User.find_by username: session[:username]
    return nil unless user.present?

    user_session = UserSession.new user, session[:group_id]

    # store current group id in session
    session[:group_id] = user_session.current_group_id

    user_session
  end
end
