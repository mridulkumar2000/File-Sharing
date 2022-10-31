include ActionView::Helpers::NumberHelper

class ApplicationController < ActionController::Base
    helper_method :current_user, :get_file_size

    def current_user
        @current_user = User.find(session[:user_id]) if session[:user_id] 
    end

    def require_user
        redirect_to '/login' unless current_user
    end

    def get_file_size(byte)
        number_to_human_size(byte)
    end

end
