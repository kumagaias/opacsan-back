require 'test_helper'

class BookVolumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_volume = book_volumes(:one)
  end

  test "should get index" do
    get book_volumes_url, as: :json
    assert_response :success
  end

  test "should create book_volume" do
    assert_difference('BookVolume.count') do
      post book_volumes_url, params: { book_volume: { book_id: @book_volume.book_id, volume: @book_volume.volume } }, as: :json
    end

    assert_response 201
  end

  test "should show book_volume" do
    get book_volume_url(@book_volume), as: :json
    assert_response :success
  end

  test "should update book_volume" do
    patch book_volume_url(@book_volume), params: { book_volume: { book_id: @book_volume.book_id, volume: @book_volume.volume } }, as: :json
    assert_response 200
  end

  test "should destroy book_volume" do
    assert_difference('BookVolume.count', -1) do
      delete book_volume_url(@book_volume), as: :json
    end

    assert_response 204
  end
end
