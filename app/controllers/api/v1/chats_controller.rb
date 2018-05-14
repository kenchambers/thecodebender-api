module Api
  module V1
    class ChatsController < ApplicationController
      def index
        @messages = Message.order(created_at: :asc)
      end
    end
  end
end
