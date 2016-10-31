class AuthenticationController < ApplicationController
  # TODO handle LTI auth
  def lti

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

end
