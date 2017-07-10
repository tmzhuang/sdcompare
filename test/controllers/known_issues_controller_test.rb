require 'test_helper'

class KnownIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @known_issue = known_issues(:one)
  end

  test "should get index" do
    get known_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_known_issue_url
    assert_response :success
  end

  test "should create known_issue" do
    assert_difference('KnownIssue.count') do
      post known_issues_url, params: { known_issue: {  } }
    end

    assert_redirected_to known_issue_url(KnownIssue.last)
  end

  test "should show known_issue" do
    get known_issue_url(@known_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_known_issue_url(@known_issue)
    assert_response :success
  end

  test "should update known_issue" do
    patch known_issue_url(@known_issue), params: { known_issue: {  } }
    assert_redirected_to known_issue_url(@known_issue)
  end

  test "should destroy known_issue" do
    assert_difference('KnownIssue.count', -1) do
      delete known_issue_url(@known_issue)
    end

    assert_redirected_to known_issues_url
  end
end
