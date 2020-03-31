class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    # UserWorker.perform_at(10.seconds.from_now, @user.id, 10)
    # UserWorker.perform_at(10.seconds.from_now, @user.id, 10)
    # HappyBirthdayJob.perform_later @user.id, 5
    HappyBirthdayJob.set(wait: 20.seconds).perform_later @user.id, 1
    # @user.update age: 10
    redirect_to user_path @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create name: params[:user][:name], age: params[:user][:age], email: params[:user][:email]
    flash[:success] = "Tao thanh cong"
    # UserMailer.welcome_email(@user).deliver_now
    HappyBirthdayJob.perform_later @user
    redirect_to user_path @user
  end
end
