class RemovePaperclipFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :projects, :image
  end
end
