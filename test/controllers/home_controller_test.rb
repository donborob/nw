require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :show
    assert_response :success
  end

end
