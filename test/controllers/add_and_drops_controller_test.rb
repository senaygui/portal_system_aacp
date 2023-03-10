require 'test_helper'

class AddAndDropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_and_drop = add_and_drops(:one)
  end

  test "should get index" do
    get add_and_drops_url
    assert_response :success
  end

  test "should get new" do
    get new_add_and_drop_url
    assert_response :success
  end

  test "should create add_and_drop" do
    assert_difference('AddAndDrop.count') do
      post add_and_drops_url, params: { add_and_drop: {  } }
    end

    assert_redirected_to add_and_drop_url(AddAndDrop.last)
  end

  test "should show add_and_drop" do
    get add_and_drop_url(@add_and_drop)
    assert_response :success
  end

  test "should get edit" do
    get edit_add_and_drop_url(@add_and_drop)
    assert_response :success
  end

  test "should update add_and_drop" do
    patch add_and_drop_url(@add_and_drop), params: { add_and_drop: {  } }
    assert_redirected_to add_and_drop_url(@add_and_drop)
  end

  test "should destroy add_and_drop" do
    assert_difference('AddAndDrop.count', -1) do
      delete add_and_drop_url(@add_and_drop)
    end

    assert_redirected_to add_and_drops_url
  end
end
