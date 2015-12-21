require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_select 'title', "Sign up | Ruby on Rails Tutorial Sample App"
    assert_response :success
  end

end
