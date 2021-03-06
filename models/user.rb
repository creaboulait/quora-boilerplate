class User < ActiveRecord::Base
	validates :email, presence: { message: "Email must not be blank."}, uniqueness: { message: "Email has already been used to register account."},
	          format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"} 
	validates :password, length: { minimum: 8, message: "Password must be alphanumeric with at least 8 characters." }

	#Using bcrypt
	has_secure_password 

end

