class AddGenreToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :genre, :string
    add_column :scripts, :views, :integer
    add_column :authors, :name, :string
  end
end
