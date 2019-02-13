require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "sports")
    @category2 =Category.create(name: "programming") 
  end
  
  test "should show categories listing" do
    
     get categories_path
     assert_template 'categories/index'
     #now making sure that the links of the list of categories are actually correct
     assert_select "a[href=?]", category_path(@category), text: @category.name #@category.name is what we expect to see on the page
     assert_select "a[href=?]", category_path(@category2), text: @category2.name #@category.name is what we expect to see on the page
  end
 
end #class