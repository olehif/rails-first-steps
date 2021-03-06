class SurveysController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @questions   = Question.all
  end

  def show
    @question    = Question.find(params[:id])
  end

  def new_q
    @question    = Question.new
  end

  def create_f
    @field       = Field.new(params.require(:field).permit(:variant,:question_id))
    @field.count = 0
    @field.save
    redirect_to root_path
  end

  def increment
    @f = Field.find(params[:id])
    if    Vote.where(user_id: current_user.id, question_id: @f.question.id).exists?
      redirect_to root_path
    else
      v = Vote.new(user_id: current_user.id, question_id: @f.question.id, field_id: @f.id)
      v.save
      @f.count += 1
      if @f.save
        render 'thanks'
      else
        redirect_to root_path
      end
    end
  end
end
