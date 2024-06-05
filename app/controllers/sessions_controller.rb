# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end
end
