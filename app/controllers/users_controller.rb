class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_admin
  
  def index
    if current_user.admin 
      @users = User.where(approved: true)
    else
      redirect_to root_path
    end
  end

  def index_pending
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

  def approved
    @user = User.all
    @user = User.find_by(id: params[:id])
    @user.update(approved: true)
    return unless @user.save

    flash[:notice] = 'Successfully approved trader registration'
    ApprovedAccountMailer.with(email: @user.email).approve_email.deliver_now
    redirect_to admin_users_pending_path
  end

  def remove_pending_user
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'You have Successfully rejected pending trader'

    else
      flash.now[:alert] = 'There is something wrong please try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

  
end
