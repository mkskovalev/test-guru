class TestPassagesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
    questions_count = @test_passage.test.questions.count.to_f
   @result = ((@test_passage.correct_questions / questions_count) * 100).round(0)
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    call = result.call
    @gist_url = call.html_url

    save_gist if result.success?

    flash_options = if result.success?
      { success: "#{view_context.link_to(t('.success'), @gist_url, target: '_blank')}" }
    else
      { danger: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def save_gist
    Gist.create(user_id: current_user.id,
                question_id: @test_passage.current_question.id,
                url: @gist_url)
  end
end
