require "test_helper"

class BugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug = bugs(:one)
  end

  test "should get index" do
    get bugs_url
    assert_response :success
  end

  test "should get new" do
    get new_bug_url
    assert_response :success
  end

  test "should create bug" do
    assert_difference("Bug.count") do
      post bugs_url, params: { bug: { actual_resolution_date: @bug.actual_resolution_date, approved: @bug.approved, approved_by: @bug.approved_by, assigned_to: @bug.assigned_to, comment_id: @bug.comment_id, created_by: @bug.created_by, identified_by: @bug.identified_by, identified_date: @bug.identified_date, image_url: @bug.image_url, issue_description: @bug.issue_description, issue_title: @bug.issue_title, modified_by: @bug.modified_by, priority: @bug.priority, progress: @bug.progress, project_id: @bug.project_id, resolution_summary: @bug.resolution_summary, status: @bug.status, status_modified_date: @bug.status_modified_date, target_resolution_date: @bug.target_resolution_date } }
    end

    assert_redirected_to bug_url(Bug.last)
  end

  test "should show bug" do
    get bug_url(@bug)
    assert_response :success
  end

  test "should get edit" do
    get edit_bug_url(@bug)
    assert_response :success
  end

  test "should update bug" do
    patch bug_url(@bug), params: { bug: { actual_resolution_date: @bug.actual_resolution_date, approved: @bug.approved, approved_by: @bug.approved_by, assigned_to: @bug.assigned_to, comment_id: @bug.comment_id, created_by: @bug.created_by, identified_by: @bug.identified_by, identified_date: @bug.identified_date, image_url: @bug.image_url, issue_description: @bug.issue_description, issue_title: @bug.issue_title, modified_by: @bug.modified_by, priority: @bug.priority, progress: @bug.progress, project_id: @bug.project_id, resolution_summary: @bug.resolution_summary, status: @bug.status, status_modified_date: @bug.status_modified_date, target_resolution_date: @bug.target_resolution_date } }
    assert_redirected_to bug_url(@bug)
  end

  test "should destroy bug" do
    assert_difference("Bug.count", -1) do
      delete bug_url(@bug)
    end

    assert_redirected_to bugs_url
  end
end
