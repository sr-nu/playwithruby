class CreateQuestionaires < ActiveRecord::Migration
  def change
    create_table :questionaires do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
