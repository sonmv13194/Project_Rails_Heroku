require 'test_helper'

class PageHomeControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "Ruby on Rails Tutorial Sample App"
	end

  test "should get home" do
    get page_home_home_url
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get page_home_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get page_home_about_url
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get page_home_contact_url
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end

end