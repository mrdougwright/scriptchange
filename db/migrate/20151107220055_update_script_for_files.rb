class UpdateScriptForFiles < ActiveRecord::Migration
  def up
    add_column :scripts, :file_url, :string
  end

  def down
    remove_column :scripts, :file_url
  end
end
