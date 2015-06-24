class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :description, null: false, length: { minimum: 50 }
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
