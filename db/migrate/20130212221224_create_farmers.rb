class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :farmers, :name
  end
end
