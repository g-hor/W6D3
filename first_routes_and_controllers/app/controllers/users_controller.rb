class UsersController < ApplicationController

    def index
        # @users = User.all
        # render json: @users
        render plain: "I'm in the index action!"
    end

    # def show
    #     render json: User.find(params[:id])
    # end

    # def create
    #     @user = User.new(user_params)


    # end

end