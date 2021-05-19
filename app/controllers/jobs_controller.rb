class JobsController <ApplicationController
    before_action :authorize


    def index
        @user = current_user
        @jobs = @user.jobs
    end

    def new
        @user = current_user
        if @user.type != "Owner"
            redirect_to user_path(@user), notice: "Oops! You must be an Owner to request Sitter services."
        end
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to jobs_path
        else
            flash.now[:notice] = "Oops, couldn't complete this request. Please make sure you are using a valid information and try again."
            render :new
        end
    end

    def show
        @user = current_user
        @job = Job.find_by(id: params[:id])
        @sitter = Sitter.find_by(id: @job.sitter_id)
        @owner = Owner.find_by(id: @job.owner_id)

        render :owner_job if @user == @owner
        render :sitter_job if @user == @sitter
    end

    def update 
        @job = Job.find_by(id: params[:id])
        @job.update(job_params)
        @job.save
        redirect_to job_path(@job), notice: "Job staus updated."
    end

    private

    def job_params 
        params.require(:job).permit(:sitter_id, :owner_id, :date_time, :specifics, :acceptance_status, :completion_status)
    end

end