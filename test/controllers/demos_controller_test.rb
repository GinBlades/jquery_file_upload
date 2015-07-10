require 'test_helper'

class DemosControllerTest < ActionController::TestCase
  test "should get angular" do
    get :angular
    assert_response :success
  end

  test "should get basic" do
    get :basic
    assert_response :success
  end

  test "should get basic_plus" do
    get :basic_plus
    assert_response :success
  end

  test "should get basic_plus_ui" do
    get :basic_plus_ui
    assert_response :success
  end

  test "should get jquery_ui" do
    get :jquery_ui
    assert_response :success
  end

end
