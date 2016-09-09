class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def destroy
        
        if User.destroy(params[:id])
            session['msgc_reg'] = "User deleted successfully"
            redirect_to '/admin' 
        else
            session['msgc_err'] = "Error: User could not be deleted. Error Code: USR002"
            redirect_to '/admin' 
        end
    end
    
    def create 
        if User.where(:email => params[:user][:email]).blank?
            if params[:admin_user]
                @user = User.new(user_admin_params)
                @user.isAdmin = true
                if @user.save 
                  UserMailer.registration_confirmation(@user).deliver
                  #session[:user_id] = @user.id 
                  session['msgs_reg'] = "New company account created please confirm your email!"
                  redirect_to '/login' 
                else 
                  redirect_to '/login' 
                end 
            elsif params[:reg_user]
                @user = User.new(user_reg_params)
                @user.isAdmin = false
                @user.company_name = current_user.company_name
                if @user.save
                  UserMailer.registration_confirmation(@user).deliver
                    session['msgc_reg'] = "New user created please check email to activate!"
                    redirect_to '/admin' 
                else 
                    session['msgc_err'] = "User could not be created. Err code: USR001"
                    redirect_to '/admin' 
                end   
            end
            
        else
            if params[:reg_user]
                session['msgc_err'] = "Sorry, the email " + params[:user][:email] + " already exists in our database"
                redirect_to '/admin'
            else
                session['msgs'] = "The email " + params[:user][:email] + " already exists in our database"
                redirect_to '/'
            end
        end   
    end
    
    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_confirmed = true
            user.confirm_token = nil
            user.save
            session['msgl_reg'] = "Welcome to the App! Your email has been confirmed.
            Please sign in to continue."
            redirect_to '/'
        else
            session['msg'] = "Sorry. User does not exist"
            redirect_to '/'
        end
    end
    
    private
        def user_admin_params
            params.require(:user).permit(:company_name, :email, :phone, :password)
        end
    
    private
        def user_reg_params
            params.require(:user).permit(:email, :phone, :password)
        end
    

    
end
