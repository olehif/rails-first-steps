class ChangeQuestionIdToFieldIdInVotes < ActiveRecord::Migration
  def change
    add_column    :votes, :field_id,    :integer
  end
end
