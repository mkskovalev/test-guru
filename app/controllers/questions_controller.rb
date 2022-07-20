class QuestionsController < ApplicationController
  before_action :find_test_by_params, only: %i[index new create]
  before_action :find_test_by_question, only: %i[edit update]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@test_for_edit)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@test)
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test_by_params
    @test = Test.find(params[:test_id])
  end

  def find_test_by_question
    find_question
    @test_for_edit = Test.find(@question.test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Такого вопроса не нашлось :('
  end
end
