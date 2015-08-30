class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id
      t.integer :script_id

      t.timestamps null: false
    end
  end
end
