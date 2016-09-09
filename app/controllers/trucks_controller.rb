class TrucksController < ApplicationController
    
    layout :resolve_layout
    
    def new
        @truck = Truck.new
    end
    

    def show
        require 'ostruct'
        #Posting = OpenStruct.new(:from, :to, :company_name ,:phone, :email, :extra_duration)
        @user = User.all
    end
    
    
    
    def create
        @truck = Truck.new(truck_params) 
        if params[:create]
            @truck.user_id = session[:user_id]
            if @truck.save 
                session[:msg_truck_posting] = 'Truck posting created!'
                redirect_to '/' 
            end
        elsif params[:search]
            session[:temp_truck] = @truck;
            redirect_to '/show' 
        end
            
    end
    
    private
        def truck_params
            params.require(:truck).permit(:from_loc, :from_country, :to_loc, :to_country, :distance, :duration, :company_name)
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
