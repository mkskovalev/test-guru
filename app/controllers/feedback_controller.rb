class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def update
    required = [:email, :message]
    form_complete = true

    required.each do |f|
      if params.has_key? f and not params[f].blank?
      else
        form_complete = false
      end
    end

    if form_complete
      FeedbackMailer.feedback_email(params[:email], params[:message]).deliver_now
      flash[:success] = 'Your feedback was successfuly send!'
      render :index
    else
      flash[:danger] = 'Error! Feedback dosnt send, try again!'
      render :index
    end
  end
end
