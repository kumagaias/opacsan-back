require 'test_helper'

class BookCheckoutHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_checkout_history = book_checkout_histories(:one)
  end

  test "should get index" do
    get book_checkout_histories_url, as: :json
    assert_response :success
  end

  test "should create book_checkout_history" do
    assert_difference('BookCheckoutHistory.count') do
      post book_checkout_histories_url, params: { book_checkout_history: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show book_checkout_history" do
    get book_checkout_history_url(@book_checkout_history), as: :json
    assert_response :success
  end

  test "should update book_checkout_history" do
    patch book_checkout_history_url(@book_checkout_history), params: { book_checkout_history: {  } }, as: :json
    assert_response 200
  end

  test "should destroy book_checkout_history" do
    assert_difference('BookCheckoutHistory.count', -1) do
      delete book_checkout_history_url(@book_checkout_history), as: :json
    end

    assert_response 204
  end
end
