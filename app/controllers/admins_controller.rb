class AdminsController < ApplicationController
  def index
    @questions = Question.all
  end
end
