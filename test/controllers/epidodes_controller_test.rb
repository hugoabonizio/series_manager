require 'test_helper'

class EpidodesControllerTest < ActionController::TestCase
  test "should get watch" do
    get :watch
    assert_response :success
  end

end
