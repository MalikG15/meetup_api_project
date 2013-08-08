class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.meetup_id = params[:meetup_id]

    @comment.save

    redirect_to meetup_path(@comment.meetup)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
