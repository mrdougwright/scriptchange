class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.text :tagline
      t.text :summary

      t.timestamps null: false
    end
  end
end
