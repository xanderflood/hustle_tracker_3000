require 'test_helper'

class HustlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hustle = hustles(:one)
  end

  test "should get index" do
    get hustles_url
    assert_response :success
  end

  test "should get new" do
    get new_hustle_url
    assert_response :success
  end

  test "should create hustle" do
    assert_difference('Hustle.count') do
      post hustles_url, params: { hustle: { created: @hustle.created, modified: @hustle.modified, name: @hustle.name, user_id: @hustle.user_id } }
    end

    assert_redirected_to hustle_url(Hustle.last)
  end

  test "should show hustle" do
    get hustle_url(@hustle)
    assert_response :success
  end

  test "should get edit" do
    get edit_hustle_url(@hustle)
    assert_response :success
  end

  test "should update hustle" do
    patch hustle_url(@hustle), params: { hustle: { created: @hustle.created, modified: @hustle.modified, name: @hustle.name, user_id: @hustle.user_id } }
    assert_redirected_to hustle_url(@hustle)
  end

  test "should destroy hustle" do
    assert_difference('Hustle.count', -1) do
      delete hustle_url(@hustle)
    end

    assert_redirected_to hustles_url
  end
end
