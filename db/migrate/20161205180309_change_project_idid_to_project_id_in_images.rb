class ChangeProjectIdidToProjectIdInImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :project, foreign_key: true
  end
end
