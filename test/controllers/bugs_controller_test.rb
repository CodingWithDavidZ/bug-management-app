require 'test_helper'

class BugsControllerTest < ActionDispatch::IntegrationTest
  setup { @bug = bugs(:one) }

  test 'should get index' do
    get bugs_url
    assert_response :success
  end

  test 'should get new' do
    get new_bug_url
    assert_response :success
  end

  test 'should create bug' do
    assert_difference('Bug.count') do
      post bugs_url,
           params: {
             bug: {
               actual_resolution_date: @bug.actual_resolution_date,
               approved: @bug.approved,
               assigned_tostatus: @bug.assigned_tostatus,
               comment_id: @bug.comment_id,
               created_by: @bug.created_by,
               identified_by: @bug.identified_by,
               image_url: @bug.image_url,
               indentified_date: @bug.indentified_date,
               issue_description: @bug.issue_description,
               issue_summary: @bug.issue_summary,
               modified_by: @bug.modified_by,
               priority: @bug.priority,
               progress: @bug.progress,
               related_project_id: @bug.related_project_id,
               resolution_summary: @bug.resolution_summary,
               target_resolution_date: @bug.target_resolution_date
             }
           }
    end

    assert_redirected_to bug_url(Bug.last)
  end

  test 'should show bug' do
    get bug_url(@bug)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bug_url(@bug)
    assert_response :success
  end

  test 'should update bug' do
    patch bug_url(@bug),
          params: {
            bug: {
              actual_resolution_date: @bug.actual_resolution_date,
              approved: @bug.approved,
              assigned_tostatus: @bug.assigned_tostatus,
              comment_id: @bug.comment_id,
              created_by: @bug.created_by,
              identified_by: @bug.identified_by,
              image_url: @bug.image_url,
              indentified_date: @bug.indentified_date,
              issue_description: @bug.issue_description,
              issue_summary: @bug.issue_summary,
              modified_by: @bug.modified_by,
              priority: @bug.priority,
              progress: @bug.progress,
              related_project_id: @bug.related_project_id,
              resolution_summary: @bug.resolution_summary,
              target_resolution_date: @bug.target_resolution_date
            }
          }
    assert_redirected_to bug_url(@bug)
  end

  test 'should destroy bug' do
    assert_difference('Bug.count', -1) { delete bug_url(@bug) }

    assert_redirected_to bugs_url
  end
end
