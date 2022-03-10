require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup { @project = projects(:one) }

  test 'should get index' do
    get projects_url
    assert_response :success
  end

  test 'should get new' do
    get new_project_url
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url,
           params: {
             project: {
               actual_end_date: @project.actual_end_date,
               created_by: @project.created_by,
               modified_by: @project.modified_by,
               project_name: @project.project_name,
               start_date: @project.start_date,
               target_end_date: @project.target_end_date
             }
           }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    get project_url(@project)
    assert_response :success
  end

  test 'should get edit' do
    get edit_project_url(@project)
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project),
          params: {
            project: {
              actual_end_date: @project.actual_end_date,
              created_by: @project.created_by,
              modified_by: @project.modified_by,
              project_name: @project.project_name,
              start_date: @project.start_date,
              target_end_date: @project.target_end_date
            }
          }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) { delete project_url(@project) }

    assert_redirected_to projects_url
  end
end
