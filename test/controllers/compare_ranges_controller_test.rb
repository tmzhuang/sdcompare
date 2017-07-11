require 'test_helper'

class CompareRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compare_range = compare_ranges(:one)
  end

  test "should get index" do
    get compare_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_compare_range_url
    assert_response :success
  end

  test "should create compare_range" do
    assert_difference('CompareRange.count') do
      post compare_ranges_url, params: { compare_range: {  } }
    end

    assert_redirected_to compare_range_url(CompareRange.last)
  end

  test "should show compare_range" do
    get compare_range_url(@compare_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_compare_range_url(@compare_range)
    assert_response :success
  end

  test "should update compare_range" do
    patch compare_range_url(@compare_range), params: { compare_range: {  } }
    assert_redirected_to compare_range_url(@compare_range)
  end

  test "should destroy compare_range" do
    assert_difference('CompareRange.count', -1) do
      delete compare_range_url(@compare_range)
    end

    assert_redirected_to compare_ranges_url
  end
end
