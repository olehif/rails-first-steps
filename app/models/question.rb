class Question < ActiveRecord::Base
  has_many :fields
  has_many :votes
end
