class WelcomeJob < ApplicationJob
  queue_as :default

  def perform(user)
    WelcomeMailer.welcome_email(user).deliver
  end
end
