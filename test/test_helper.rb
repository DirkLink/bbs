ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
class ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def login user=nil
    # user = user || User.first
    user ||= User.first
    sign_in user
    user
  end

end
