class MessagesController < ApplicationController

    def new
    end

    def create
    end

    private

    def message_params 
        params.require(:message).permit(:user, :job, :content)
      end
end