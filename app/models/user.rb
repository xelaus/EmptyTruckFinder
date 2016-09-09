class User < ActiveRecord::Base 
    has_secure_password
    has_many :trucks
    before_create :confirmation_token
    
    def admin? 
        self.isAdmin == true
    end
    
    private
        def confirmation_token
          if self.confirm_token.blank?
              self.confirm_token = SecureRandom.urlsafe_base64.to_s
          end
        end
    
    
    def activate
        self.email_confirmed = true
        self.confirm_token = nil
        self.save
    end
end
