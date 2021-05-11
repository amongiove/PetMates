class JobsController <ApplicationController

    def index
        @user = User.find_by(id: session[:user_id])
        @jobs = @user.jobs
    end

    def new
        puts "NEW JOB"
        puts params
        @user = User.find_by(id: session[:user_id])
        if @user.type != "Owner"
            redirect_to user_path(@user), notice: "You must be an Owner to do this."
        end
    end

    def create
        puts "CREATE"
        puts params
        @job = Job.new(job_params)
        if @job.save
            redirect_to job_path(@job)
        else
            flash.now[:notice] = "Unable to complete request." #TODO: make this more specific
            render :new
        end
    end

    def show
        @job = Job.find_by(id: params[:id])
    end

    private

    def job_params 
        params.require(:job).permit(:sitter_id, :owner_id, :date_time, :specifics, :acceptance_status, :completion_status)
      end

end