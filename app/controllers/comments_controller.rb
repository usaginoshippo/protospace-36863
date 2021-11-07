class CommentsController < ApplicationController
  def create
    @comment=Comment.new(comment_params)
    if @comment.save
      redirect_to "/prototype/#{comment.prototype.id}"
    else
      render "prototypes/show"
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: curent_user.id)
  end
end
