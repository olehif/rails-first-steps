class SurveysController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new_q
    @question = Question.new
  end

  def create_q
    @q = Question.new(params.require(:question).permit(:title,:body))
    @q.save
    redirect_to root_path
  end

  def new_f
    @field = Field.new
    @questions = Question.all
  end

  def create_f
    @field = Field.new(params.require(:field).permit(:variant,:question_id))
    @field.count = 0
    @field.save
    redirect_to root_path
  end

  def increment
    @f = Field.find(params[:id])
    @f.count += 1
    if @f.save
      redirect_to root_path
    else
      render 'index'
    end
  end
end
