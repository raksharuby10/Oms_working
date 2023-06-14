class ApproveJob < ApplicationJob
  queue_as :default

  def perform(complaint)
    ApproveMailer.status(complaint).deliver
  end
end
