class AddComplaintJob < ApplicationJob
  queue_as :default
  def perform(complaint)
    AddComplaintMailer.add_complaint_email(complaint).deliver_now
    AddMailer.complaint(complaint).deliver_now
  end
end
