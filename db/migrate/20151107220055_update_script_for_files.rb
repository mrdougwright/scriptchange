class UpdateScriptForFiles < ActiveRecord::Migration
  def up
    remove_column :scripts, :pdf_content_type
    remove_column :scripts, :pdf_file_size
    remove_column :scripts, :pdf_updated_at
    add_column :scripts, :file_url, :string
  end

  def down
    add_column :scripts, :pdf_content_type, :string
    add_column :scripts, :pdf_file_size, :integer
    add_column :scripts, :pdf_updated_at, :datetime
    remove_column :scripts, :file_url
  end
end
