class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.references :taker, null: false
      t.references :survey, null: false

      t.timestamps null: false
    end
  end
end
