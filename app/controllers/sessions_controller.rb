class SessionsController < ApplicationController
    
    layout :resolve_layout
    
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
             if @user.email_confirmed
                session[:user_id] = @user.id
                redirect_to '/'
             else
                 session['msg'] = "Please activate your account! (Check your email)" 
                 redirect_to '/'
             end
        else
          session['msg'] = "Wrong email or password combination"
          redirect_to '/'
        end 
    end
    
    def destroy 
        session[:user_id] = nil 
        redirect_to '/' 
    end
    
    
    private   
      def resolve_layout
       case action_name
         when "new"
          "application"
         else 
          "main"
         end
      end

    
end
