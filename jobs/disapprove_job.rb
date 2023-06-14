class DisapproveJob < ApplicationJob
  queue_as :default

  def perform(complaint)
    DispproveMailer.status(complaint).deliver
  end
end
