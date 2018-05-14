class Message < ApplicationRecord
  after_create_commit do
   MessageCreateBroadcastJob.perform_later(self)
 end
  # belongs_to :chatroom
  # belongs_to :user

end
