class User < ActiveRecord::Base

    def self.authenticate_with_credentials(email, password)
        
        filtered_email = email.downcase.strip 
        user = User.find_by_email(filtered_email)

        if user && user.authenticate(password)
            user           
       else
           nil
        end
    end
    
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length:{in: 6..15}
    validates :password_confirmation, length:{in: 6..15}
end
