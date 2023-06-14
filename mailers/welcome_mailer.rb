class WelcomeMailer < ApplicationMailer
	def welcome_email(user)
	   @user = user
	   @url  = 'http://localhost:3000/'
       mail(to: @user.email, from: "rubyraksha10@gmail.com",subject: 'Welcome to My Awesome Site')
	end
end
