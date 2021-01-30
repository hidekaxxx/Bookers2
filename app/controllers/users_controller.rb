class UsersController < ApplicationController
  before_action :ensure_correct_user,{only:[:edit,:update]}

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully updated!"
      redirect_to user_path(@user.id)
    else
      render("users/edit")
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:notice] = "権限ないよ"
      redirect_to user_path(current_user.id)
    end
    end

end