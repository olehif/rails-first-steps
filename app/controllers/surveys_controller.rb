class SurveysController < ApplicationController
  def index
    @questions = Question.all
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
