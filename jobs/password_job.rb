class PasswordJob < ApplicationJob
  queue_as :default
  def perform(time,user)
    byebug
    PasswordMailer.reset(user).deliver
  end
end
