class UsersController < ApplicationController

    def new
        if session[:user_id]
            redirect_to '/' if User.find(session[:user_id])
        else
            @user = User.new
        end
    end

    def create
        @user = User.new
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render :new
        end
    end

    def show
        @user = User.new
    end

    def edit
        @user = User.new
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(user_params)
            @profile_updated = true
            render :show
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :full_name, :email, :password)
    end

end