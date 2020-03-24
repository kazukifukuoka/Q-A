class QuestionsController < ApplicationController
before_action :set_question , only:[:show,:update,:edit,:destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params_question)
    if @question.save
      redirect_to root_path
      flash[:notice] = 'Success!'
    else
      render 'new'
      flash[:alert] = 'Save error!'
    end
  end

  def edit
  end

  def update
    if @question.update(params_question)
      redirect_to root_path
      flash[:notice] = 'Success'
    else
      render 'edit'
      flash[:alert] = 'Save error!'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path , notice: 'Success!'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def params_question
      params.require(:question).permit(:name,:title,:content)
    end
end
