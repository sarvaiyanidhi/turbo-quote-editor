require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end

  test "Create New Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    click_on "New Quote"
    assert_selector "h1", text: "New quote"
    fill_in "Name", with: "Capybara Quote"
    click_on "Create quote"
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara Quote"
  end

  test "Show Quote" do
    visit quotes_path
    click_link @quote.name
    assert_selector "h1", text: !quote.name
  end

  test "Updating Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"
    fill_in "Name", with: "Updated Quote"
    click_on "Update quote"
    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Deleting Quote" do
    visit quotes_path
    assert_text @quote.name
    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
