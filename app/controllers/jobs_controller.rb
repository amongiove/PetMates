class JobsController <ApplicationController

    def index
        @user = User.find_by(id: session[:user_id])
        @jobs = @user.jobs
    end

    def new
        puts "NEW JOB"
        puts params
        # @sitter = Sitter.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        if @user.type != "Owner"
            redirect_to user_path(@user), notice: "You must be an Owner to do this."
        end
    end

    def create
        puts "CREATE"
        puts params
    end

    def show
    end

    private

    def job_params 
        params.require(:job).permit(:sitter_id, :owner_id, :date, :time, :specifics, :acceptance_status, :completion_status)
      end

end