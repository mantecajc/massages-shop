require "application_system_test_case"

class MassagesTest < ApplicationSystemTestCase
  setup do
    @massage = massages(:one)
  end

  test "visiting the index" do
    visit massages_url
    assert_selector "h1", text: "Massages"
  end

  test "should create massage" do
    visit massages_url
    click_on "New massage"

    fill_in "Brief description", with: @massage.brief_description
    fill_in "Duration", with: @massage.duration
    fill_in "Large description", with: @massage.large_description
    fill_in "Price", with: @massage.price
    fill_in "Subtitle", with: @massage.subtitle
    fill_in "Title", with: @massage.title
    click_on "Create Massage"

    assert_text "Massage was successfully created"
    click_on "Back"
  end

  test "should update Massage" do
    visit massage_url(@massage)
    click_on "Edit this massage", match: :first

    fill_in "Brief description", with: @massage.brief_description
    fill_in "Duration", with: @massage.duration
    fill_in "Large description", with: @massage.large_description
    fill_in "Price", with: @massage.price
    fill_in "Subtitle", with: @massage.subtitle
    fill_in "Title", with: @massage.title
    click_on "Update Massage"

    assert_text "Massage was successfully updated"
    click_on "Back"
  end

  test "should destroy Massage" do
    visit massage_url(@massage)
    click_on "Destroy this massage", match: :first

    assert_text "Massage was successfully destroyed"
  end
end
