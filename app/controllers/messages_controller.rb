class MessagesController < ApplicationController

    def new
        @job = Job.find_by(id: params[:job_id])
        @user = User.find_by(id: session[:user_id])
    end

    def create
        @job = Job.find_by(id: params[:job_id])
        @message = Message.new(message_params)
        if @message.save
            redirect_to job_path(@job), notice: "Message Sent."
        else
            redirect_to job_path(@job), notice: "Unable to send message at this time." #TODO: make this more specific
        end
    end

    private

    def message_params 
        params.require(:message).permit(:user_id, :job_id, :content)
      end
end