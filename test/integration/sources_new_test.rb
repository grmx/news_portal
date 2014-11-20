require 'test_helper'

class SourcesAddTest < ActionDispatch::IntegrationTest
  test "add new source page" do
    get new_source_path
    assert_template 'sources/new'
    assert_select "h1", "Add source"
    assert_select "a[href=?]", sources_path, text: "Back to list"
  end

  test "invalid source information" do
    get new_source_path
    assert_no_difference 'Source.count' do
      post sources_path, source: { title: "",
                                   description: "",
                                   uri: "" }
    end
    assert_template 'sources/new'
    assert_not flash.nil?
    assert_select 'div#errors'
    assert_select 'div.field_with_errors'
    get sources_path
    assert flash.empty?, "Page contains an old flash message."
  end
  
  test "valid source information" do
    get new_source_path
    assert_difference 'Source.count', 1 do
      post_via_redirect sources_path, source: { title: "Example feed",
                                                description: "About feed",
                                                uri: "http://example.com/feed" }
    end
    assert_template 'sources/show'
    assert_not flash.nil?
  end
end
