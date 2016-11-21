require 'rails_helper'
require 'lti_sample_data'

RSpec.describe LTIUser do
  context 'on initialization' do
    it 'extracts an email and a username from LTI fields' do
      @lti_user = LTIUser.new(SAMPLE_LTI_REQUEST)
      expect(@lti_user.instance_variable_get('@email')).to eq SAMPLE_LTI_REQUEST['lis_person_contact_email_primary']
      expect(@lti_user.instance_variable_get('@username')).to eq SAMPLE_LTI_REQUEST['ext_user_username']
      expect(@lti_user.instance_variable_get('@firstname')).to eq SAMPLE_LTI_REQUEST['lis_person_name_given']
      expect(@lti_user.instance_variable_get('@lastname')).to eq SAMPLE_LTI_REQUEST['lis_person_name_family']
      expect(@lti_user.instance_variable_get('@lms_role')).to eq SAMPLE_LTI_REQUEST['roles']
    end

  end
  pending 'it can update_attributes'
  pending 'it can generate a JWT token'
end
