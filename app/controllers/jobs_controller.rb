class JobsController <ApplicationController

    def index
        @user = User.find_by(id: session[:user_id])
        @jobs = @user.jobs
    end

    def new
        @user
    end

    def create
    end

    def show
    end

    private

    def job_params 
        params.require(:job).permit(:sitter_id, :owner_id, :date, :time, :specifics, :acceptance_status, :completion_status)
      end

end