require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category:{name:"sports"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do # trying to submit empty category name
  
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{name:" "}}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title' #through that class we see errors on our screen as defined in _errors.html.erb
    assert_select 'div.panel-body' #through that class we see errors on our screen as defined in _errors.html.erb
  end #test
  
  
end #class