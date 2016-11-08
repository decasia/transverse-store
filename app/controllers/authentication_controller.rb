require 'ims/lti'
require 'oauth/request_proxy/action_controller_request'

class AuthenticationController < ApplicationController
  def lti
    #### Setup and error handling for LTI OAuth flow
    # Lookup group by consumer key; the group then provides the OAuth shared secret
    consumer_key = params[:oauth_consumer_key]
    raise 'Missing consumer key' unless consumer_key.present?

    @group = Group.by_oauth_key(consumer_key)
    raise "Failed to find group for consumer key #{consumer_key}" unless @group.present?

    provider = IMS::LTI::ToolProvider.new(consumer_key, @group.oauth_consumer_secret, params)

    #### Update user data and redirect with a JWT if given a valid request
    if provider.valid_request? request
      # create/update internal user record from LTI record
      # NB this implicitly trusts whatever user data we get from the LTI system
      @lti_user = LTIUser.new(params)
      @lti_user.update_attributes(@group)

      # redirect with JWT token to ember app
      puts "LTI auth succeeded for #{@lti_user}"
      redirect_to ui_login_path(@lti_user.token)
    else
      #### Failure should be rare because LTI auth is fairly well-defined.
      raise 'LTI auth failed'
    end
  rescue => e
    puts e.message, params.inspect
    # NB the client will now have to figure out how to handle a missing JWT
    redirect_to ui_login_path('')
  end

  def change_group
    if params[:group_id]
      if current_user
        begin
          current_user.change_group params[:group_id]
          render json: current_user
        rescue => e
          render json: {error: 'Invalid group ID'}, status: 400
        end
      else
        render json: {error: 'Must be authenticated'}, status: 401
      end
    else
      render json: {error: 'Invalid parameters'}, status: 400
    end
  end

  protected
  def ui_login_path(token)
    # this value is set by an ENV value because it will vary depending
    # on the ember app's routing architecture.
    # we substitute the actual token for the placeholder value ('JWT_VALUE')
    Rails.application.config.x.redirect_on_lti_auth.sub('JWT_VALUE', token)
  end
end
