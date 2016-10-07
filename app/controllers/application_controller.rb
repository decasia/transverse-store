class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # TODO we should have an auth flow that uses session cookies once established,
  # otherwise requests login.
  def current_user
    # eventually pass currently selected group at init
    UserSession.new(User.first)
  end
end
