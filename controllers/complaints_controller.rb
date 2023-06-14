class ComplaintsController < ApplicationController
  def index    
    @complaints = Complaint.all
    @url = request.url
    @data=@url.split("/")[3].split("=")[1]
  end
  def new 
    @complaint = current_user.complaints.new
  end
  def show
    @complaint=Complaint.find(params[:id])
  end
  def create
    @complaint = current_user.complaints.new(complaint_params)
    if @complaint.save
      AddComplaintJob.set(wait: 10.seconds).perform_later(@complaint)
      if @complaint.complaint_type == "concern"
    	 redirect_to complaints_path(:complaint_type => "concern")
      else
       redirect_to complaints_path(:complaint_type => "appreciate")
      end
    else
      render :new
    end
  end
  def edit
    @complaint=Complaint.find(params[:id])
  end
  def update
    @complaint=Complaint.find(params[:id])
    if @complaint.update(complaint_params)
      if current_user.role == "admin" && @complaint.status == "disapproved"
        DisapproveJob.set(wait: 10.seconds).perform_later(@complaint)
      end
      redirect_to @complaint
    else
       render :edit
    end
  end
  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy
    redirect_to complaints_path
  end
  def change_status
    @complaint = Complaint.find(params[:id])
    if params[:status] == "disapproved"
       redirect_to edit_complaint_path(@complaint)
    else
       if params[:status].present?
          @complaint.update(status: params[:status])
          ApproveJob.set(wait: 10.seconds).perform_later(@complaint)
          redirect_to @complaint, notice: "Status changed to #{@complaint.status}"
       else
         redirect_to complaints_path, alert: "Stop hacking"
       end
    end
  end

  private 
  def complaint_params
    params.require(:complaint).permit(:user_id, :category_id, :description,:status,:reject_reason,:complaint_type,pictures: [])
  end
end
