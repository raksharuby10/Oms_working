 class PasswordMailer < ApplicationMailer
    def reset(user)
      @token = user.signed_id(purpose: 'password_reset', expires_in: 15.minutes)
      @email = user.email
      mail(to: user.email, from: "rubyraksha10@gmail.com")
    end
  end