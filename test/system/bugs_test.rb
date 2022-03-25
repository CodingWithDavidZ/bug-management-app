require "application_system_test_case"

class BugsTest < ApplicationSystemTestCase
  setup do
    @bug = bugs(:one)
  end

  test "visiting the index" do
    visit bugs_url
    assert_selector "h1", text: "Bugs"
  end

  test "should create bug" do
    visit bugs_url
    click_on "New bug"

    fill_in "Actual resolution date", with: @bug.actual_resolution_date
    check "Approved" if @bug.approved
    fill_in "Approved by", with: @bug.approved_by
    fill_in "Assigned to", with: @bug.assigned_to
    fill_in "Comment", with: @bug.comment_id
    fill_in "Created by", with: @bug.created_by
    fill_in "Identified by", with: @bug.identified_by
    fill_in "Identified date", with: @bug.identified_date
    fill_in "Image url", with: @bug.image_url
    fill_in "Issue description", with: @bug.issue_description
    fill_in "Issue title", with: @bug.issue_title
    fill_in "Modified by", with: @bug.modified_by
    fill_in "Priority", with: @bug.priority
    fill_in "Progress", with: @bug.progress
    fill_in "Project", with: @bug.project_id
    fill_in "Resolution summary", with: @bug.resolution_summary
    fill_in "Status", with: @bug.status
    fill_in "Status modified date", with: @bug.status_modified_date
    fill_in "Target resolution date", with: @bug.target_resolution_date
    click_on "Create Bug"

    assert_text "Bug was successfully created"
    click_on "Back"
  end

  test "should update Bug" do
    visit bug_url(@bug)
    click_on "Edit this bug", match: :first

    fill_in "Actual resolution date", with: @bug.actual_resolution_date
    check "Approved" if @bug.approved
    fill_in "Approved by", with: @bug.approved_by
    fill_in "Assigned to", with: @bug.assigned_to
    fill_in "Comment", with: @bug.comment_id
    fill_in "Created by", with: @bug.created_by
    fill_in "Identified by", with: @bug.identified_by
    fill_in "Identified date", with: @bug.identified_date
    fill_in "Image url", with: @bug.image_url
    fill_in "Issue description", with: @bug.issue_description
    fill_in "Issue title", with: @bug.issue_title
    fill_in "Modified by", with: @bug.modified_by
    fill_in "Priority", with: @bug.priority
    fill_in "Progress", with: @bug.progress
    fill_in "Project", with: @bug.project_id
    fill_in "Resolution summary", with: @bug.resolution_summary
    fill_in "Status", with: @bug.status
    fill_in "Status modified date", with: @bug.status_modified_date
    fill_in "Target resolution date", with: @bug.target_resolution_date
    click_on "Update Bug"

    assert_text "Bug was successfully updated"
    click_on "Back"
  end

  test "should destroy Bug" do
    visit bug_url(@bug)
    click_on "Destroy this bug", match: :first

    assert_text "Bug was successfully destroyed"
  end
end
