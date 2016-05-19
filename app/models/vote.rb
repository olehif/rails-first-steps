class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :field

  validates :user_id, :question_id, presence: true
end
