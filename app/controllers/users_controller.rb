# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      redirect :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
