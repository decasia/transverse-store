class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Knock::Authenticable
  include CanCan::ControllerAdditions
end
