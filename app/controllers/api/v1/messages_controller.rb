module Api
  module V1
    class MessagesController < ApplicationController
      def index
        p "--"*99
        p "index hit!"
        p "--"*99

        @messages = Message.order(created_at: :asc)
        # format.json { render json: @messages.to_json }



      end
      def create
        p "--"*99
        p "create hit!"
        p "--"*99

        @message = Message.new(params[:message])
        conversation = Conversation.find(message_params[:conversation_id])
        if @message.save
          serialized_data = @message
          MessagesChannel.broadcast_to "chats_channel", serialized_data
        head :ok
        end
      end
    end
  end
end
