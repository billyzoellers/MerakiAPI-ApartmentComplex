require 'test_helper'

class UnitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unit_index_url
    assert_response :success
  end

  test "should get show" do
    get unit_show_url
    assert_response :success
  end

  test "should get edit" do
    get unit_edit_url
    assert_response :success
  end

end
