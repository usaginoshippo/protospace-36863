class PrototypesController < ApplicationController
  
  def index
  end

  def show
    @comment=Comment.new
    @comments=@prototype.comments.include(:user)
  end
end
