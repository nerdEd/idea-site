class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.create(params[:comment]) do |c|
      c.user = current_user
      c.commentable_type = @idea.class.to_s
      c.commentable_id = @idea.id
    end

    if @comment.errors.blank?
      flash.notice = 'Comment posted!'
    else
      flash.alert = 'Your comment could not be posted.'
    end
    redirect_to idea_url(@idea)
  end
end
