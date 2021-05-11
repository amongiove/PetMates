class MessagesController < ApplicationController

    def new
        @job = Job.find_by(id: params[:job_id])
        @user = User.find_by(id: session[:user_id])
    end

    def create
    end

    private

    def message_params 
        params.require(:message).permit(:user_id, :job_id, :content)
      end
end