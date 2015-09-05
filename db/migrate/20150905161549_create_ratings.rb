class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :script_id
      t.integer :stars, default: 0

      t.timestamps null: false
    end
  end
end
