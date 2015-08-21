class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.text :tagline
      t.text :summary
      t.string :filename
      t.string :content_type
      t.binary :data

      t.timestamps null: false
    end
  end
end
