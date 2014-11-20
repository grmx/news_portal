require 'test_helper'

class SourcesControllerTest < ActionController::TestCase
  def setup
    @base_title = "News Portal"
    @source = sources(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Add source · #{@base_title}"
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "All sources · #{@base_title}"
  end
end
