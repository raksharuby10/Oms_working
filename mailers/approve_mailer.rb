class ApproveMailer < ApplicationMailer

  def status(complaint)
      @complaint = complaint
      user = complaint.user_id
      @user_current = User.find(user) 
      user_email =  @user_current.email

      @url  = 'http://localhost:3000/'
      @user_data = User.find_by role: 'admin'
      email = @user_data.email
      mail(to: user_email, from: "rubyraksha10@gmail.com",subject: 'Welcome to My Awesome Site')
    end
end
