class AddTypeAndStatusToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_type, :integer
    add_column :questions, :active, :boolean
  end
end
