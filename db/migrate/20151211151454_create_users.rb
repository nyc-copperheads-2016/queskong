class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_hash, null: false
      t.string :race, null:false
      t.integer :age, null:false
      t.string :sex, null: false
      t.string :religion, null: false

      t.timestamps null: false
    end
  end
end
