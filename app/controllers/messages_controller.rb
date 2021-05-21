class MessagesController < ApplicationController
    before_action :authorize
  
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
            flash[:notice] = "Oops! #{@message.errors.full_messages.to_sentence}. Please try again."
            redirect_to job_path(@job)
        end  
    end

    private

    def message_params 
        params.require(:message).permit(:user_id, :job_id, :content)
      end
end