require 'test_helper'

class SpeciesControllerControllerTest < ActionController::TestCase
  test "should get creature" do
    get :creature
    assert_response :success
  end

end
