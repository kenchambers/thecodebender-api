class ChatsChannel < ApplicationCable::Channel
  # before_action :require_login

  def subscribed
    p "----------------"
    # p 'user subscribed'
    # p current_user
    p "----------------"
    # stream_from "some_channel"
    # @chat = Chats.find_by(id: params[:chat_id])
    # stream_for @line
    stream_from "chats_channel"

  end

  def sendMessage(message)

  end

  def received
    ChatsChannel.broadcast_to(@chat, {chat: @chat, users:
        @chat.waiting_users})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end

  def create(opts)
    Message.create(
      content: opts.fetch('content')
    )
    # message = current_user.messages.build(content: opts.fetch('content'))
      # if data['file_uri']
        # message.attachment_name = data['original_name']
        # message.attachment_data_uri = data['file_uri']
      # end
      # message.save
    # end

    # p "~~~"*99


    # p "~~~"*99

  end

end
