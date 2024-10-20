class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.float :similarity

      t.timestamps
    end
  end
end
