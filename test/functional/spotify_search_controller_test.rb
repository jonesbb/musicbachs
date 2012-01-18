require 'test_helper'

class SpotifySearchControllerTest < ActionController::TestCase
  test "should get artist" do
    get :artist
    assert_response :success
  end

  test "should get album" do
    get :album
    assert_response :success
  end

end
