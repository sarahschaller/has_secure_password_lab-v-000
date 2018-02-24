class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_index_path
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id].clear if session[:user_id]
  end
end
