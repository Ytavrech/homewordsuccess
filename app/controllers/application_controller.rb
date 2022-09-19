class ApplicationController < ActionController::Base
    http_basic_authenticate_with :name => "ytavrech@gmail.com", :password => "12345"

    # def admin_controller?
    #   self.class < ActiveAdmin::BaseController
    # end
        # debugger    
        # @user = User.find(user_id)
        # http_basic_authenticate_with name: 'ytavrech@bestpeers.com', password: '1234'
        # binding.pry
        
        # authenticate_or_request_with_http_basic do |username, password|
        #     username == 'curren_user.email' && password == 'current_user.password'
        # end
        # binding.pry

        # http_basic_authenticate_with name: '#{user.email}', password: '#{user.password}'



      

        #   User ||= authenticate_or_request_with_http_basic do |u, p|
        #     User.find(email: u, password: p)
        #   end

end
