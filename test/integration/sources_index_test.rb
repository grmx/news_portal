require 'test_helper'

class SourcesTest < ActionDispatch::IntegrationTest
  def setup
    @source = sources(:one)
  end

  test "index sources page" do
    get sources_path
    assert_template 'sources/index'
    assert_select "h1", "All sources"
    assert_select "a[href=?]", new_source_path, text: "Add new source"
  end
  
  test "show source page" do
    get source_path(@source)
    assert_template 'sources/show'
    assert_select "h1", @source.title
    assert_select "a[href=?]", sources_path, text: "Back to list"
  end
  
  test "edit source page" do
    get edit_source_path(@source)
    assert_template 'sources/edit'
    assert_select "h1", "Edit source"
    assert_select "a[href=?]", sources_path, text: "Back to list"
    assert_select "input[value=?]", @source.title
  end
  
  test "destroy source page" do
    assert_difference 'Source.count', -1 do
      delete source_path(@source)
    end
  end
end
