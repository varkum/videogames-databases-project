require "application_system_test_case"

class VideogamesTest < ApplicationSystemTestCase
  setup do
    @videogame = videogames(:one)
  end

  test "visiting the index" do
    visit videogames_url
    assert_selector "h1", text: "Videogames"
  end

  test "should create videogame" do
    visit videogames_url
    click_on "New videogame"

    fill_in "Developer", with: @videogame.developer
    fill_in "Editorschoice", with: @videogame.editorschoice
    fill_in "Genre", with: @videogame.genre
    fill_in "Name", with: @videogame.name
    fill_in "Platform", with: @videogame.platform
    fill_in "Year", with: @videogame.year
    click_on "Create Videogame"

    assert_text "Videogame was successfully created"
    click_on "Back"
  end

  test "should update Videogame" do
    visit videogame_url(@videogame)
    click_on "Edit this videogame", match: :first

    fill_in "Developer", with: @videogame.developer
    fill_in "Editorschoice", with: @videogame.editorschoice
    fill_in "Genre", with: @videogame.genre
    fill_in "Name", with: @videogame.name
    fill_in "Platform", with: @videogame.platform
    fill_in "Year", with: @videogame.year
    click_on "Update Videogame"

    assert_text "Videogame was successfully updated"
    click_on "Back"
  end

  test "should destroy Videogame" do
    visit videogame_url(@videogame)
    click_on "Destroy this videogame", match: :first

    assert_text "Videogame was successfully destroyed"
  end
end
