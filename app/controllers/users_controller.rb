class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @Prototypes = @user.prototype
  end
end
