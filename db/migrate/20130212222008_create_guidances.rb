class CreateGuidances < ActiveRecord::Migration
  def change
    create_table :guidances do |t|
      t.integer :user_id
      t.integer :farmer_id

      t.timestamps
    end

    add_index :guidances, :user_id
    add_index :guidances, :farmer_id
    add_index :guidances, [:user_id, :farmer_id], unique: true
  end
end
