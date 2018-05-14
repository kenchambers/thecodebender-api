class MessageCreateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable
      .server
      .broadcast('chats_channel',
                 id: message.id,
                 created_at: message.created_at.strftime('%H:%M'),
                 content: message.content)
  end
end
