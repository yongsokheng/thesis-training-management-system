class Admin::FeedbacksController < ApplicationController
  load_and_authorize_resource

  def index
    @feedbacks = Feedback.order(created_at: :desc).preload(:user)
      .per_page_kaminari(params[:page]).per 10

    add_breadcrumb_index "feedbacks"
  end

  def show
    add_breadcrumb_path "feedbacks"
    add_breadcrumb @feedback.subject
  end
end
