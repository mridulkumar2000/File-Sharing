class FilesController < ApplicationController
    before_action :require_user, except: [:show]

    def index 
        @documents = current_user.documents.order(created_at: :desc)
    end

    def create
        
    end

end