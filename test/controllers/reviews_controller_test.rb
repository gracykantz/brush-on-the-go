require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get content" do
    get reviews_content_url
    assert_response :success
  end

  test "should get rating:integer" do
    get reviews_rating:integer_url
    assert_response :success
  end

  test "should get user:references" do
    get reviews_user:references_url
    assert_response :success
  end

  test "should get product:references" do
    get reviews_product:references_url
    assert_response :success
  end

end
