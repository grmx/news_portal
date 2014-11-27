require 'test_helper'

class SessionsTest < ActionDispatch::IntegrationTest
  def setup
     @user = users(:one) 
  end

  test "unsuccessful sign in" do
    get new_sessions_path
    post sessions_path, session: { email: "", password: "" }
    assert_not flash.empty?
    get root_path
    assert flash.empty?, "Flash message after redirect."
  end
  
  test "successful sign in" do
    get new_sessions_path
    post_via_redirect sessions_path, session: { email: @user.email, password: 'password' }
    assert_template 'news/index'
  end
end
