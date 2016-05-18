class AdminsController < ApplicationController
  before_action :authenticate_admin!
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
    Field.find(params[:id]).destroy
    redirect_to admins_index_path
  end

  def create_f
    @field    = Field.new(params.require(:field).permit(:variant, :question_id))
    @field.save
    redirect_to new_field_path(id: params.require(:field)[:question_id])
  end

  def create
    @question = Question.new(params.require(:question).permit(:body, :title, :question_type, :active))
    @question.save
    case @question.question_type
      when 1
        redirect_to new_field_path(id: @question.id)
      when 2
        f=Field.new(question_id: @question.id, variant: "")
        f.save
        redirect_to admins_index_path
      when 3
        f=Field.new(question_id: @question.id, variant: "За")
        f.save
        f=Field.new(question_id: @question.id, variant: "Проти")
        f.save
        redirect_to admins_index_path
    end
  end

  def update
    @question =Question.find(params.require(:question)[:id])
    @question.update(params.require(:question).permit(:body, :title, :question_type, :active))
    @question.save
    if @question.question_type == 1
      redirect_to new_field_path(id: @question.id)
    else
      redirect_to admins_index_path
    end
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
    @question= Question.find(params[:id])
  end
end
