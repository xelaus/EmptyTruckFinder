class HomeController < ApplicationController
    #these are useless?
    before_action :require_user, only: [:index]
    before_action :require_admin, only: [:admin]
    
    layout :resolve_layout
     
    def index
        @truck = Truck.new
    end
    
    def admin
        @user = User.new
        @users = User.where(:company_name => current_user.company_name)
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
