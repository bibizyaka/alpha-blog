require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports") # that runs in my test DB (not development DB)
  end
  
  test "category should be valid" do
    assert @category.valid?
    
  end
  
  test "name schould be present" do # will pass as true if creation was NOT successfull
     @category.name = " "
     assert_not @category.valid?, "Saved category without category name!"
     
  end
  
  test "name schould be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.save, "unique name of category is compropized!"
  end
  
  test "name schould not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?, "name too long went trough!"
  end
  test "name schould not be to short" do
    @category.name = "ab"
    assert_not @category.valid?, "name too short went trough!"
  end
  
  
end #class