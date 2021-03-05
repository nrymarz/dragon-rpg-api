class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, :include => :gamesaves
    end

    def show
        user = User.find_by(name: params[:id].parameterize)
        render json: user, :include => :gamesaves
    end

    def create
        user = User.new(name: user_params[:name])
        save = Gamesave.new(user_params[:gamesave])
        user.gamesaves.push(save)
        user.name = user.name.parameterize
        if user.save
            render json: user
        else
            render error:{error:"Unable to create User"},status: 400
        end
    end

    def update
        user = User.find_by(name: user_params[:name].parameterize)
        if user
            gamesave = Gamesave.new(user_params[:gamesave])
            user.gamesaves.push(gamesave)
            user.save
            render json: {message: "User updated"},status: 200
        else
            render json: {error: "Unable to update user"}, status: 400
        end
    end

    private 

    def user_params
        params.require(:user).permit( :name, :gamesave => [:player,:inventory])
    end
end
