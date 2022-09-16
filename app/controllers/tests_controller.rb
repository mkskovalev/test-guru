class TestsController < ApplicationController

  before_action :find_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  SECONDS_IN_MINUTE = 60

  def index
    @tests = Test.active
  end

  def start
    current_user.tests.push(@test)
    Timer.create(test_passage: current_user.test_passage(@test), end_time: time_to_timestamp)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def time_to_timestamp
    (Time.now + (@test.time * SECONDS_IN_MINUTE)).to_i
  end
end
