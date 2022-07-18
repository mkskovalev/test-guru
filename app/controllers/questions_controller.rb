class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to test_questions_url
  end

  private

  def question_params
    params.permit(:test_id).reverse_merge!(params.require(:question).permit(:body))
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Такого вопроса не нашлось :('
  end
end
