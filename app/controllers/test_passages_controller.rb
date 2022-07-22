class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
    unless @test_passage.comleted?
      @completed_questions = @test_passage.question_count
    end
  end

  def result
    questions_count = @test_passage.test.questions.count.to_f
   @result = ((@test_passage.correct_questions / questions_count) * 100).round(0)
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.comleted?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
