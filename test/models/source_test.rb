require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  def setup
    @source = Source.new(title: "Example source", 
                         description: "Example description",
                         uri: "http://example.com/atom.xml")
  end
  
  test "should be valid" do
    assert @source.valid?
  end
  
  test "title should be presence" do
    @source.title = "    "
    assert !@source.valid?
  end
  
  test "description should be presence" do
    @source.description = "    "
    assert !@source.valid?
  end
  
  test "uri should be presence" do
    @source.uri = "    "
    assert !@source.valid?
  end
  
  test "title should not be too long" do
    @source.title = "a" * 51
    assert !@source.valid?
  end

  test "description should not be too long" do
    @source.description = "a" * 256
    assert !@source.valid?
  end
  
  test "uri should not be too long" do
    @source.uri = "a" * 256
    assert !@source.valid?
  end
  

  
end
