class DocumentsController < ApplicationController
    before_action :require_user, except: [:show]

    def index 
        @documents = current_user.documents.order(created_at: :desc)
    end

    def create
        
    end

    private
    def create_file_params
        params.require(:document).permit(:file)
    end

end