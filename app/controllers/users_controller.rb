class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_admin
  
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
      
  def index
    if current_user.admin 
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|  
      if @user.update(user_params)
        format.html { redirect_to action: "index", notice: 'Updated succesfully' }
      else 
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

  # def authenticate_admin
  #   if current_user && current_user.admin 
  #     redirect_to action: "index"
  #   else
  #     render "You are not allowed in this page"
  #   end
  # end
end

