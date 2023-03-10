require 'test_helper'

class MakeupExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @makeup_exam = makeup_exams(:one)
  end

  test "should get index" do
    get makeup_exams_url
    assert_response :success
  end

  test "should get new" do
    get new_makeup_exam_url
    assert_response :success
  end

  test "should create makeup_exam" do
    assert_difference('MakeupExam.count') do
      post makeup_exams_url, params: { makeup_exam: {  } }
    end

    assert_redirected_to makeup_exam_url(MakeupExam.last)
  end

  test "should show makeup_exam" do
    get makeup_exam_url(@makeup_exam)
    assert_response :success
  end

  test "should get edit" do
    get edit_makeup_exam_url(@makeup_exam)
    assert_response :success
  end

  test "should update makeup_exam" do
    patch makeup_exam_url(@makeup_exam), params: { makeup_exam: {  } }
    assert_redirected_to makeup_exam_url(@makeup_exam)
  end

  test "should destroy makeup_exam" do
    assert_difference('MakeupExam.count', -1) do
      delete makeup_exam_url(@makeup_exam)
    end

    assert_redirected_to makeup_exams_url
  end
end
