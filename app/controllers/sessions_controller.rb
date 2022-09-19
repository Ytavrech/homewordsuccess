class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    #   binding.pry
    if user.present? && user.authenticate(params[:password]) #&& user.confirmed
      session[:user_id] = user.id
      # @article.user_id = current_user.id

      # if user.email_confirmed
        # redirect_to todolists_path
      
        redirect_to :controller => "articles", :action => "new"


    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end


     
      # else
      #     flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
      #     render 'new'
      # end
    # else
    #    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
    #    render 'new'
    # end

  # end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
