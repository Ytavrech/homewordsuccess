class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    #   binding.pry
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      # @article.user_id = current_user.id
      
      redirect_to :controller => "articles", :action => "new"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
