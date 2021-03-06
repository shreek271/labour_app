require 'test_helper'

class MainPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Sunny's App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Sunny's App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Sunny's App"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Sunny's App"
  end

end
