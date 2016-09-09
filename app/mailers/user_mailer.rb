class UserMailer < ActionMailer::Base
    default :from => "" #mail from adress

    def registration_confirmation(user)
       @user = user
        mail(:to => "#{user.company_name} <#{user.email}>", :subject => "Registration Confirmation")
    end
end

