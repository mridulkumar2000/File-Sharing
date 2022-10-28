class SessionsController < ApplicationController

    def new
        is_session_present = session[:user_id]
        if is_session_present && User.find_by_id(session[:user_id])
            redirect_to root_path
        end
    end

    def create
        @params = params[:session]
        if @params 
            user_name = @params[:user_name]
            @user = User.find_by(user_name: user_name) if user_name
            if @user && @user.authenticate(@params[:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                render :new
            end
        else
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end

end