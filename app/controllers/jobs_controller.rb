class JobsController <ApplicationController

    def index
        @user = User.find_by(id: session[:user_id])
        @jobs = @user.jobs
    end

    def new
        @user = User.find_by(id: session[:user_id])
        if @user.type != "Owner"
            redirect_to user_path(@user), notice: "You must be an Owner to do this."
        end
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to jobs_path
        else
            flash.now[:notice] = "Unable to complete request." #TODO: make this more specific
            render :new
        end
    end

    def show
        @user = User.find_by(id: session[:user_id])
        @job = Job.find_by(id: params[:id])
        @sitter = Sitter.find_by(id: @job.sitter_id)
        @owner = Owner.find_by(id: @job.owner_id)

        render :owner_job if @user == @owner
        render :sitter_job if @user == @sitter
    end

    private

    def job_params 
        params.require(:job).permit(:sitter_id, :owner_id, :date_time, :specifics, :acceptance_status, :completion_status)
      end

end