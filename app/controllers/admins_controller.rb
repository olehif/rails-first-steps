class AdminsController < ApplicationController
  before_action :find_question, only: [:edit, :show, :close, :new_f]

  def index
    @questions = Question.all
  end

  def edit
  end

  def new
    @question = Question.new
    @fields   = @question.fields
  end

  def new_f
    @fields   = @question.fields
    @field    = Field.new(question_id: @question.id)
  end

  def destroy_f
    @field    = Field.find(params[:id])
    @field.destroy
    respond_to do |format|
      format.html { redirect_to admins_index_path }
      format.js
    end
  end

  def create_f
    @field    = Field.new(params.require(:field).permit(:variant, :question_id))
    @field.save
    respond_to do |format|
      format.html { redirect_to new_field_path(id: @field.question_id) }
      format.js
    end
  end

  def create
    @question = Question.new(params.require(:question).permit(:body, :title, :question_type, :active))
    @question.save
    redirect_to admins_index_path
  end

  def show
  end

  def close
    @question.active = false
    @question.save
    redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
