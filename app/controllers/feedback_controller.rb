class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    if params[:email].present? && params[:message].present?
      FeedbackMailer.feedback_email(params[:email], params[:message]).deliver_now
      flash[:success] = 'Your feedback was successfuly send!'
    else
      flash[:danger] = 'Error! Feedback dosnt send, try again!'
    end

    render :new
  end
end
