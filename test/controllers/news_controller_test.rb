require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", full_title()
  end
end
