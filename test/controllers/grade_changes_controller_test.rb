require 'test_helper'

class GradeChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grade_change = grade_changes(:one)
  end

  test "should get index" do
    get grade_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_grade_change_url
    assert_response :success
  end

  test "should create grade_change" do
    assert_difference('GradeChange.count') do
      post grade_changes_url, params: { grade_change: {  } }
    end

    assert_redirected_to grade_change_url(GradeChange.last)
  end

  test "should show grade_change" do
    get grade_change_url(@grade_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_grade_change_url(@grade_change)
    assert_response :success
  end

  test "should update grade_change" do
    patch grade_change_url(@grade_change), params: { grade_change: {  } }
    assert_redirected_to grade_change_url(@grade_change)
  end

  test "should destroy grade_change" do
    assert_difference('GradeChange.count', -1) do
      delete grade_change_url(@grade_change)
    end

    assert_redirected_to grade_changes_url
  end
end
