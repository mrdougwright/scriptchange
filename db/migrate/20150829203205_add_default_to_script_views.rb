class AddDefaultToScriptViews < ActiveRecord::Migration
  def change
    change_column :scripts, :views, :integer, default: 0
  end
end
