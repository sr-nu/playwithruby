class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
