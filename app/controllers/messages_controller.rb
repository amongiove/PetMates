class MessagesController < ApplicationController

    def new
        @job = Job.find_by(id: params[:job_id])
        @user = current_user
    end

    def create
        @job = Job.find_by(id: params[:job_id])
        @message = Message.new(message_params)
        if @message.save
            redirect_to job_path(@job), notice: "Message successfully sent."
        else
            redirect_to job_path(@job), notice: "Oops! Unable to send message at this time. Please make sure you have valid information and try again." 
        end
    end

    private

    def message_params 
        params.require(:message).permit(:user_id, :job_id, :content)
      end
end