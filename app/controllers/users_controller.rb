class UsersController < ApplicationController

    def new
        if session[:user_id]
            redirect_to '/login' if User.find(session[:user_id])
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        user_name = user_params['user_name'];
        email = user_params['email'];
        @is_user_name_present = User.exists?(user_name: user_name)
        @is_user_email_present = User.exists?(email: email)
        
        if @is_user_name_already_present || @is_user_email_already_present 
            render :new and return
        end

        if @user.save 
            session[:user_id] = @user.id
            @is_user_name_present = false;
            @is_user_email_present = false;
            redirect_to '/login'
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = User.find(session[:user_id])
        @is_user_email_present = User.exists?(email: user_params['email'])        
        
        if @is_user_email_present 
            render :edit and return
        end

        if @user.update(user_params)
            @has_updated_profile = true
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