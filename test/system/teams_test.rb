require 'application_system_test_case'

class TeamsTest < ApplicationSystemTestCase
  setup { @team = teams(:one) }

  test 'visiting the index' do
    visit teams_url
    assert_selector 'h1', text: 'Teams'
  end

  test 'should create team' do
    visit teams_url
    click_on 'New team'

    fill_in 'Created by', with: @team.created_by
    fill_in 'Lead', with: @team.lead
    fill_in 'Modified by', with: @team.modified_by
    fill_in 'Name', with: @team.name
    fill_in 'Project', with: @team.project_id
    click_on 'Create Team'

    assert_text 'Team was successfully created'
    click_on 'Back'
  end

  test 'should update Team' do
    visit team_url(@team)
    click_on 'Edit this team', match: :first

    fill_in 'Created by', with: @team.created_by
    fill_in 'Lead', with: @team.lead
    fill_in 'Modified by', with: @team.modified_by
    fill_in 'Name', with: @team.name
    fill_in 'Project', with: @team.project_id
    click_on 'Update Team'

    assert_text 'Team was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Team' do
    visit team_url(@team)
    click_on 'Destroy this team', match: :first

    assert_text 'Team was successfully destroyed'
  end
end