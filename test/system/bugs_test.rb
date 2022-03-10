require 'application_system_test_case'

class BugsTest < ApplicationSystemTestCase
  setup { @bug = bugs(:one) }

  test 'visiting the index' do
    visit bugs_url
    assert_selector 'h1', text: 'Bugs'
  end

  test 'should create bug' do
    visit bugs_url
    click_on 'New bug'

    fill_in 'Actual resolution date', with: @bug.actual_resolution_date
    check 'Approved' if @bug.approved
    fill_in 'Assigned tostatus', with: @bug.assigned_tostatus
    fill_in 'Comment', with: @bug.comment_id
    fill_in 'Created by', with: @bug.created_by
    fill_in 'Identified by', with: @bug.identified_by
    fill_in 'Image url', with: @bug.image_url
    fill_in 'Indentified date', with: @bug.indentified_date
    fill_in 'Issue description', with: @bug.issue_description
    fill_in 'Issue summary', with: @bug.issue_summary
    fill_in 'Modified by', with: @bug.modified_by
    fill_in 'Priority', with: @bug.priority
    fill_in 'Progress', with: @bug.progress
    fill_in 'Related project', with: @bug.related_project_id
    fill_in 'Resolution summary', with: @bug.resolution_summary
    fill_in 'Target resolution date', with: @bug.target_resolution_date
    click_on 'Create Bug'

    assert_text 'Bug was successfully created'
    click_on 'Back'
  end

  test 'should update Bug' do
    visit bug_url(@bug)
    click_on 'Edit this bug', match: :first

    fill_in 'Actual resolution date', with: @bug.actual_resolution_date
    check 'Approved' if @bug.approved
    fill_in 'Assigned tostatus', with: @bug.assigned_tostatus
    fill_in 'Comment', with: @bug.comment_id
    fill_in 'Created by', with: @bug.created_by
    fill_in 'Identified by', with: @bug.identified_by
    fill_in 'Image url', with: @bug.image_url
    fill_in 'Indentified date', with: @bug.indentified_date
    fill_in 'Issue description', with: @bug.issue_description
    fill_in 'Issue summary', with: @bug.issue_summary
    fill_in 'Modified by', with: @bug.modified_by
    fill_in 'Priority', with: @bug.priority
    fill_in 'Progress', with: @bug.progress
    fill_in 'Related project', with: @bug.related_project_id
    fill_in 'Resolution summary', with: @bug.resolution_summary
    fill_in 'Target resolution date', with: @bug.target_resolution_date
    click_on 'Update Bug'

    assert_text 'Bug was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Bug' do
    visit bug_url(@bug)
    click_on 'Destroy this bug', match: :first

    assert_text 'Bug was successfully destroyed'
  end
end
