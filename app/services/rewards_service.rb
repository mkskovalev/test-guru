class RewardsService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end



  def give_rewards
    Badge.all.each do |badge|
      case badge.rule
      when 'completed_tests_by_category'
        @user.badges << badge if complete_all_by_category(badge.sub_rule)
      when 'completed_tests_by_level'
        @user.badges << badge if complete_all_by_level(badge.sub_rule)
      when 'passed_test_from_very_first_time'
        @user.badges << badge if complete_sucess_in_first_time
      end
    end
  end

  private

  def complete_all_by_category(sub_rule)
    return if @test.category.title != sub_rule

    tests = Test.active.joins_category(sub_rule)
    tests.count == completed_tests(tests).count
  end

  def complete_all_by_level(sub_rule)
    return if level_grade != sub_rule.downcase.to_sym

    tests = Test.active.send(level_grade)
    tests.count == completed_tests(tests).count
  end

  def complete_sucess_in_first_time
    @user.test_passages.completed.where(test: @test).count == 1
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
