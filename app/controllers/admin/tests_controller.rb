class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_test_url(@test), success: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_url(@test), success: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, success: t('.success')
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :active, :with_timer, :time)
  end

  def rescue_with_test_not_found
    render plain: t('.test_not_found')
  end

end
