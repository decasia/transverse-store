class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # TODO we should have users and auth
  def current_user
    {
      name: "test",
      group_id: 1
    }
  end
end
