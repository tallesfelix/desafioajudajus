require "application_system_test_case"

class CausesTest < ApplicationSystemTestCase
  setup do
    @cause = causes(:one)
  end

  test "visiting the index" do
    visit causes_url
    assert_selector "h1", text: "Causes"
  end

  test "creating a Cause" do
    visit causes_url
    click_on "New Cause"

    fill_in "Company", with: @cause.company
    fill_in "Description", with: @cause.description
    fill_in "Destiny", with: @cause.destiny
    fill_in "Origin", with: @cause.origin
    fill_in "Problem", with: @cause.problem
    click_on "Create Cause"

    assert_text "Cause was successfully created"
    click_on "Back"
  end

  test "updating a Cause" do
    visit causes_url
    click_on "Edit", match: :first

    fill_in "Company", with: @cause.company
    fill_in "Description", with: @cause.description
    fill_in "Destiny", with: @cause.destiny
    fill_in "Origin", with: @cause.origin
    fill_in "Problem", with: @cause.problem
    click_on "Update Cause"

    assert_text "Cause was successfully updated"
    click_on "Back"
  end

  test "destroying a Cause" do
    visit causes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cause was successfully destroyed"
  end
end
