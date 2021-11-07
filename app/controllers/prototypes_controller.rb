class PrototypesController < ApplicationController
  
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototypes = Prototype.new(prototype_params)
    if @prototypes.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype=Prototype.find(params[:id])
  end
  
  def edit
    @prototype=Prototype.find(params[:id])
  end
  
  def update
    prototype=Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to  prototype_path(current_user)
    else
      render :edit
  end

  def destroy
    prototype =Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def show
    @comment=Comment.new
    @comments=@prototype.comments.include(:user)
  end
end
