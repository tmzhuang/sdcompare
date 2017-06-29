require 'test_helper'

class ScreendumpResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screendump_result = screendump_results(:one)
  end

  test "should get index" do
    get screendump_results_url
    assert_response :success
  end

  test "should get new" do
    get new_screendump_result_url
    assert_response :success
  end

  test "should create screendump_result" do
    assert_difference('ScreendumpResult.count') do
      post screendump_results_url, params: { screendump_result: {  } }
    end

    assert_redirected_to screendump_result_url(ScreendumpResult.last)
  end

  test "should show screendump_result" do
    get screendump_result_url(@screendump_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_screendump_result_url(@screendump_result)
    assert_response :success
  end

  test "should update screendump_result" do
    patch screendump_result_url(@screendump_result), params: { screendump_result: {  } }
    assert_redirected_to screendump_result_url(@screendump_result)
  end

  test "should destroy screendump_result" do
    assert_difference('ScreendumpResult.count', -1) do
      delete screendump_result_url(@screendump_result)
    end

    assert_redirected_to screendump_results_url
  end
end
