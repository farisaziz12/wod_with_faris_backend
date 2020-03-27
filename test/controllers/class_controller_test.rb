require 'test_helper'

class ClassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get class_index_url
    assert_response :success
  end

  test "should get show" do
    get class_show_url
    assert_response :success
  end

  test "should get new" do
    get class_new_url
    assert_response :success
  end

  test "should get create" do
    get class_create_url
    assert_response :success
  end

  test "should get edit" do
    get class_edit_url
    assert_response :success
  end

  test "should get update" do
    get class_update_url
    assert_response :success
  end

  test "should get destroy" do
    get class_destroy_url
    assert_response :success
  end

end
