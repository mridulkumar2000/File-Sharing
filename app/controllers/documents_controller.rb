
class DocumentsController < ApplicationController
    before_action :require_user, except: [:show]

    def index 
        @documents = current_user.documents.order(created_at: :desc)
    end

    def create
        current_user.documents.create(create_file_params)
        redirect_to root_path
    end

    private
    def create_file_params
        params.permit(:file).merge(key: "#{Time.now.to_i}")
    end

end