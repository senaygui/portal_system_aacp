require "application_system_test_case"

class MakeupExamsTest < ApplicationSystemTestCase
  setup do
    @makeup_exam = makeup_exams(:one)
  end

  test "visiting the index" do
    visit makeup_exams_url
    assert_selector "h1", text: "Makeup Exams"
  end

  test "creating a Makeup exam" do
    visit makeup_exams_url
    click_on "New Makeup Exam"

    click_on "Create Makeup exam"

    assert_text "Makeup exam was successfully created"
    click_on "Back"
  end

  test "updating a Makeup exam" do
    visit makeup_exams_url
    click_on "Edit", match: :first

    click_on "Update Makeup exam"

    assert_text "Makeup exam was successfully updated"
    click_on "Back"
  end

  test "destroying a Makeup exam" do
    visit makeup_exams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Makeup exam was successfully destroyed"
  end
end
