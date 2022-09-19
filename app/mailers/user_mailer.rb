class UserMailer < ApplicationMailer
   default :from => "ytavrech@bestpeers.com"

   def registration_confirmation(user_id)
      @user = User.find(user_id)
      mail(:to => @user.email, :subject => "Registration Confirmation")
   end
end
