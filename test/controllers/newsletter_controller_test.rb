require 'test_helper'

class NewsletterControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get newsletter_sign_up_url
    assert_response :success
  end

  test "should get submit" do
    get newsletter_submit_url
    assert_response :success
  end

  test "should get success" do
    get newsletter_success_url
    assert_response :success
  end

end
