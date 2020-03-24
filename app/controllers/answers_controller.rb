class AnswersController < ApplicationController
  before_action :set_answer,only:[:create,:edit,:update,:destroy]

  def create
    @answer = Answer.create(params_answer)
    if @answer.save
      redirect_to question_path(@question)
      flash[:notice] = 'Success!'
    else
      redirect_to question_path(@question)
      flash[:alert] = 'Invalid!'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(params_answer)
      redirect_to question_path(@question)
      flash[:notice] = 'Success!'
    else
      render 'edit'
      flash[:alert] = 'Invalid'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
    flash[:notice] = 'Deleted!'
  end

  private
    def set_answer
      @question = Question.find(params[:question_id])
    end

    def params_answer
      params.require(:answer).permit(:question_id,:name,:content)
    end
end
