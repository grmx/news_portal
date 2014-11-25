require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def setup
    @news = news(:one)
  end

  test "should response to source" do
    assert_respond_to @news, :source
  end
end
