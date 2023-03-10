require "application_system_test_case"

class AddAndDropsTest < ApplicationSystemTestCase
  setup do
    @add_and_drop = add_and_drops(:one)
  end

  test "visiting the index" do
    visit add_and_drops_url
    assert_selector "h1", text: "Add And Drops"
  end

  test "creating a Add and drop" do
    visit add_and_drops_url
    click_on "New Add And Drop"

    click_on "Create Add and drop"

    assert_text "Add and drop was successfully created"
    click_on "Back"
  end

  test "updating a Add and drop" do
    visit add_and_drops_url
    click_on "Edit", match: :first

    click_on "Update Add and drop"

    assert_text "Add and drop was successfully updated"
    click_on "Back"
  end

  test "destroying a Add and drop" do
    visit add_and_drops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Add and drop was successfully destroyed"
  end
end
