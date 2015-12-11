class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :taken_survey, null: false
      t.references :question, null: false
      t.references :possibility, null: false

      t.timestamps null: false
    end
  end
end
