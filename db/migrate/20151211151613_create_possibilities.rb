class CreatePossibilities < ActiveRecord::Migration
  def change
    create_table :possibilities do |t|
      t.references :question, null: false
      t.string :choice, null: false
    end
  end
end
