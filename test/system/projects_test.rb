require 'application_system_test_case'

class ProjectsTest < ApplicationSystemTestCase
  setup { @project = projects(:one) }

  test 'visiting the index' do
    visit projects_url
    assert_selector 'h1', text: 'Projects'
  end

  test 'should create project' do
    visit projects_url
    click_on 'New project'

    fill_in 'Actual end date', with: @project.actual_end_date
    fill_in 'Created by', with: @project.created_by
    fill_in 'Modified by', with: @project.modified_by
    fill_in 'Project name', with: @project.project_name
    fill_in 'Start date', with: @project.start_date
    fill_in 'Target end date', with: @project.target_end_date
    click_on 'Create Project'

    assert_text 'Project was successfully created'
    click_on 'Back'
  end

  test 'should update Project' do
    visit project_url(@project)
    click_on 'Edit this project', match: :first

    fill_in 'Actual end date', with: @project.actual_end_date
    fill_in 'Created by', with: @project.created_by
    fill_in 'Modified by', with: @project.modified_by
    fill_in 'Project name', with: @project.project_name
    fill_in 'Start date', with: @project.start_date
    fill_in 'Target end date', with: @project.target_end_date
    click_on 'Update Project'

    assert_text 'Project was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Project' do
    visit project_url(@project)
    click_on 'Destroy this project', match: :first

    assert_text 'Project was successfully destroyed'
  end
end
