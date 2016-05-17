class AdminsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def close
    @question = Question.find(params[:id])
    @question.active = false
    @question.save
    redirect_to root_path
  end
end
