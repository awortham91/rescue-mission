class QuestionsController < ApplicationController

  def index
    @questions = Question.all

  end

  def show
    @question = Question.find(params[:id])
    @response = Response.new
    @responses = Response.where(question_id: params[:id], accepted_answer: nil).order(updated_at: :desc)
    @accepted_response = Response.where(question_id: params[:id], accepted_answer: true).first
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to '/questions'
    else
      flash[:notice] = 'Question not added.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])
    @question.update(title: question_params['title'], description: question_params['description'])
    if @question.save
      flash[:notice] = 'Question was edited'
      redirect_to "/questions/#{params[:id]}"
    else
      flash[:notice] = 'You did not do that correctly'
      redirect_to "/questions/#{params[:id]}/edit"
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @responses = Response.where(["question_id = #{params[:id]}"])
    @question.destroy
    @responses.each do |response|
      response.destroy
    end
    redirect_to '/questions'
  end

  protected
def question_params
  params.require(:question).permit(:title, :description)
end


end
