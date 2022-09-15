class RewardsService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end



  def give_rewards
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}", badge.sub_rule)
    end
  end

  private

  def completed_tests_by_category(sub_rule)
    return if @test.category.title != sub_rule

    tests = Test.active.joins_category(sub_rule)
    tests.count == completed_tests(tests).count
  end

  def completed_tests_by_level(sub_rule)
    return if level_grade != sub_rule.downcase.to_sym

    tests = Test.active.send(level_grade)
    tests.count == completed_tests(tests).count
  end

  def passed_test_from_very_first_time(_sub_rule)
    @user.test_passages.where(test: @test).count == 1
  end

  def completed_tests(tests)
    tests.joins(:test_passages)
         .distinct.where(test_passages: { user: @user, completed: true })
  end

  def level_grade
    case @test.level
    when 0..1
      :easy
    when 2..4
      :medium
    when 5..Float::INFINITY
      :hard
    end
  end
end
