class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(name: params[:id].parameterize)
        render json: user
    end

    def create
        user = User.new(user_params)
        user.name = user.name.parameterize
        if user.save
            render json: user
        else
            render error:{error:"Unable to create User"},status: 400
        end
    end

    def update
        user = User.find_by(name: params[:id].parameterize)
        if user
            user.update(name: user_params[:name].parameterize, player: user_params[:player], inventory: user_params[:inventory])
            render json: {message: "User updated"},status: 200
        else
            render json: {error: "Unable to update user"}, status: 400
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name,:player,:inventory)
    end
end
