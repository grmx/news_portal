require 'test_helper'

class SourcesEditTest < ActionDispatch::IntegrationTest
  def setup
    @source = sources(:one)
    @user   = users(:one) 
    get new_sessions_path
    post sessions_path, session: { email: @user.email, password: 'password' }
  end
  
  test "unsuccessful edit" do
    get edit_source_path(@source)
    assert_template 'sources/edit'
    patch source_path(@source), source: { title: "",
                                          description: "",
                                          uri: "" }
    assert_template 'sources/edit'
  end
  
  test "successful edit" do
    get edit_source_path(@source)
    assert_template 'sources/edit'
    title       = "New title"
    description = "New description"
    uri         = "http://example.io/feed"
    patch source_path(@source), source: { title: title,
                                          description: description,
                                          uri: uri }
    assert_not flash.empty?
    assert_redirected_to @source
    @source.reload
    assert_equal @source.title,       title
    assert_equal @source.description, description
  end
end
