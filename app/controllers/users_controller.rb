class UsersController < ApplicationController
    def new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirmation]
            redirect_to new_user_path
        else
            user = User.create(user_params)
            user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end