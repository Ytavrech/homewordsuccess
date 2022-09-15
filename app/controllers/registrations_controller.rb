class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      UserMailer.registration_confirmation(@user).deliver_now
      redirect_to sign_in_path, notice: "Successfully Created"

      redirect_to :controller => "sessions", :action => "create", notice: "Successfully created account"
    else
      render :new
    end




  # def confirm_email
  #     user = User.find_by_confirm_token(params[:id])
  #     if user
  #       user.email_activate
  #       flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
  #       Please sign in to continue."
  #       redirect_to signin_url
  #     else
  #       flash[:error] = "Sorry. User does not exist"
  #       redirect_to root_url
  #     end
  # end





  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
