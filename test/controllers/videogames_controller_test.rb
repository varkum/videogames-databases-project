require "test_helper"

class VideogamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @videogame = videogames(:one)
  end

  test "should get index" do
    get videogames_url
    assert_response :success
  end

  test "should get new" do
    get new_videogame_url
    assert_response :success
  end

  test "should create videogame" do
    assert_difference("Videogame.count") do
      post videogames_url, params: { videogame: { developer: @videogame.developer, editorschoice: @videogame.editorschoice, genre: @videogame.genre, name: @videogame.name, platform: @videogame.platform, year: @videogame.year } }
    end

    assert_redirected_to videogame_url(Videogame.last)
  end

  test "should show videogame" do
    get videogame_url(@videogame)
    assert_response :success
  end

  test "should get edit" do
    get edit_videogame_url(@videogame)
    assert_response :success
  end

  test "should update videogame" do
    patch videogame_url(@videogame), params: { videogame: { developer: @videogame.developer, editorschoice: @videogame.editorschoice, genre: @videogame.genre, name: @videogame.name, platform: @videogame.platform, year: @videogame.year } }
    assert_redirected_to videogame_url(@videogame)
  end

  test "should destroy videogame" do
    assert_difference("Videogame.count", -1) do
      delete videogame_url(@videogame)
    end

    assert_redirected_to videogames_url
  end
end
