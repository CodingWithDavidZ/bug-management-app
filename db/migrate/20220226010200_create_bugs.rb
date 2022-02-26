class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :issue_summary
      t.text :issue_description
      t.integer :identified_by
      t.date :indentified_date
      t.integer :related_project_id
      t.integer :assigned_to
      t.integer :status
      t.date :status_modified_date
      t.integer :priority
      t.date :target_resolution_date
      t.string :progress
      t.date :actual_resolution_date
      t.text :resolution_summary
      t.integer :modified_by
      t.boolean :approved
      t.integer :approved_by_id
      t.string :image_url
      t.integer :comment_id

      t.timestamps
    end
  end
end
