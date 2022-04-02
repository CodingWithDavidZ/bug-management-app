class RemoveProjectIdFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :project_id, :string
  end
end
