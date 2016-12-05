class ChangeProjectIdidToProjectIdInImages < ActiveRecord::Migration[5.0]
  def change
    remove_reference :images, :project_id, foreign_key: true
    add_reference :images, :project, foreign_key: true
  end
end
