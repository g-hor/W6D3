class UsersController < ApplicationController

    def index
        # @users = User.all
        # render json: @users
        render json: params
    end

    def show
        # render json: User.find(params[:id])
        render json: params
    end

    def create
        # @user = User.new(user_params)
        render json: params

    end

end