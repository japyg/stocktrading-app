class UsersPendingController < ApplicationController
  
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

  def show
    @users = User.find(params[:id])
  end

  def edit_pending
    @users = current_user
  end

  

  def approved
    if current_user !admin 
      pending
    else
      @users = User.find(params[:id])
      @users.update(approved: true)  
      @users.save
      redirect_to users_pending_path, notice: 'Successfully approved trader signup'
    end 
    # UserMailer.confirmation_email(@user).deliver_later
  end

  def show_pending_users
    @users = User.where(status: false)
  end


  


end
