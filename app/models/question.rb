class Question < ActiveRecord::Base
  has_many :fields
  has_many :votes

  validates :title, length: {in: 2..20}
  validates :body,  length: {in: 1..1500}
end
