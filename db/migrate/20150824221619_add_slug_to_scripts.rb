class AddSlugToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :slug, :string
    add_index :scripts, :slug
  end
end
