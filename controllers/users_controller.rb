class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
	def index
		@users = User.all	
		# if @users.present?	      
  #         render json: @users, each_serializer: UserSerializer
	 #    else
	 #      render json: {message: "Data not present"}
	 #    end
	end
	def new
		@user = User.new
	end
	def show
		@user=User.find(params[:id])
		# render json: @user, serializer: UserSerializer
	end
	def create
	    @user = User.new(user_params)
	    if @user.save
        WelcomeJob.set(wait: 10.seconds).perform_later(@user)        
        redirect_to @user
          # render json: @user, serializer: UserSerializer

	    else
	    	render :new
	      # render json: {message: "Data not create"}
	    end
	end
	def edit
     	@user=User.find(params[:id])
	end
	def update
        @user=User.find(params[:id])
	    if @user.update(user_params)
	       redirect_to @user
	       # render json: @user, serializer: UserSerializer
	    else
	       render :edit
	        # render json: {message: "Data not update"}
	    end
    end
    def destroy
	    @user = User.find(params[:id])
	    if @user.destroy
        # render json: {message: "Data deleted"}
    	  redirect_to users_path
      #else
    	 # render json: {message: "Data deleted"}
    	end

	end	 
	private	 
	def user_params
	   params.require(:user).permit(:name, :email, :password, :mobile, :image, :address, :role)
	end
end
