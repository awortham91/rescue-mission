class ResponsesController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @responses = @question.responses

  end

  def new
    @question = Product.find(params[:question_id])
    @response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)

    @response.question = @question

    if @response.save
      flash[:notice] = 'Response added.'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Response not added.'

      redirect_to "/questions/#{params[:question_id]}"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])

  end

  def update
    @response = Response.find(params[:id])
    @response.update(description: response_params['description'])
    if @response.save
      flash[:notice] = 'Response was edited'
      redirect_to "/questions/#{params[:question_id]}"
    else
      flash[:notice] = 'You did not do that correctly'
      redirect_to "/questions/#{params[:question_id]}/responses/#{params[:id]}/edit"
    end
  end

  def accepted
    @response = Response.find(params[:id])
    @response.update_attribute(:accepted_answer, true)
    flash[:notice] = 'Answer Accepted'
    redirect_to "/questions/#{params[:question_id]}"
  end

  def unaccepted
    @response = Response.find(params[:id])
    @response.update_attribute(:accepted_answer, nil)
    flash[:notice] = 'Answer Unaccepted'
    redirect_to "/questions/#{params[:question_id]}"
  end

  protected
  def response_params
    params.require(:response).permit(:description)
  end
end
