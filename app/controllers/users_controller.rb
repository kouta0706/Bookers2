class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.new
    @books = @user.books

    # @book = Book.new
    # @user = current_user
    # @books = @user.books

  end
  def create
    @user = user.new
    @book.user_id = current_user.id
    if user.save
      flash[:notice] = "Book was successfully created"
      redirect_to user_path(@user)
    # else
    #   @user = Book.all
    #   flash[:notice] = "error"
    #   @user = current_user
    #   render :index
    end
end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # @book.user_id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end

  end
  private
  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end

end
