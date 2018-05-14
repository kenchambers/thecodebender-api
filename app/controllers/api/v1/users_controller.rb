module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.order('created_at DESC')
      end

      def create

        @user = User.new(username: params[:username])




        if @user.save
            render json: @user
        else
          p "~~~~~~~~~~~~~~~~~~"
          p @user.errors
          p "~~~~~~~~~~~~~~~~~~"

          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
