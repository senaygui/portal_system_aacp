require "application_system_test_case"

class GradeChangesTest < ApplicationSystemTestCase
  setup do
    @grade_change = grade_changes(:one)
  end

  test "visiting the index" do
    visit grade_changes_url
    assert_selector "h1", text: "Grade Changes"
  end

  test "creating a Grade change" do
    visit grade_changes_url
    click_on "New Grade Change"

    click_on "Create Grade change"

    assert_text "Grade change was successfully created"
    click_on "Back"
  end

  test "updating a Grade change" do
    visit grade_changes_url
    click_on "Edit", match: :first

    click_on "Update Grade change"

    assert_text "Grade change was successfully updated"
    click_on "Back"
  end

  test "destroying a Grade change" do
    visit grade_changes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grade change was successfully destroyed"
  end
end
