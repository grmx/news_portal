require 'test_helper'

class SourcesControllerTest < ActionController::TestCase
  def setup
    @source = sources(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", full_title("Add source")
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", full_title("All sources")
  end
end
