# service figures out how to translate LTI data into our user objects
# see spec/requests/lti_auth for a sample LTI oauth request
class LTIUser
  def initialize(params)
    @email = params['lis_person_contact_email_primary']
    @username = params['ext_user_username']
    @firstname = params['lis_person_name_given']
    @lastname = params['lis_person_name_family']
    @lms_role = params['roles']
    @lms_context_title = params['context_title']
  end

  def update_attributes(group)
    @user = User.find_or_create_by(username: @username)
    @user.email = @email
    @user.firstname = @firstname
    @user.lastname = @lastname
    @user.lms_role = @lms_role
    @user.lms_context_title = @lms_context_title
    unless @user.groups.include?(group)
      @user.groups << group
    end
    @user.current_group_id = group.id
    @user.save!
  end

  def token
    Knock::AuthToken.new(payload: { sub: @user.id }).token
  end

  def to_s
    @username
  end
end
