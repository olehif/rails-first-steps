class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :variant
      t.integer :count
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
