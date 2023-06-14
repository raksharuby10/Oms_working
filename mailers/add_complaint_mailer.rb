class AddComplaintMailer < ApplicationMailer
    def add_complaint_email(complaint)
	   @complaint = complaint
	   category = complaint.category_id
	   @category_data = Category.find(category)
	   user = complaint.user_id
	   @user_current = User.find(user) 
	   @url  = 'http://localhost:3000/'
	   @user_data = User.find_by role: 'admin'
	   email = @user_data.email
	   mail(to: email,from: "rubyraksha10@gmail.com",subject: "Welcome to My Awesome Site")
    end
end
