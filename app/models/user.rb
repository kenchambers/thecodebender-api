class User < ApplicationRecord
  include Clearance::User
  has_many :messages, dependent: :destroy
  has_many :chat_rooms, :through => :messages
  validates :username, presence: true
end
