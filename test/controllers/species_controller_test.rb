require 'test_helper'

class SpeciesControllerTest < ActionController::TestCase
  test "should get creature" do
    get :creature
    assert_response :success
  end

end
