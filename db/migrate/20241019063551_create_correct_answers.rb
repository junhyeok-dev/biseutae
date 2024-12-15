class CreateCorrectAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :correct_answers do |t|
      t.string :answer, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
