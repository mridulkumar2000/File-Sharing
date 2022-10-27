
class DocumentsController < ApplicationController
    before_action :require_user, except: [:show]

    def index 
        @documents = current_user.documents.order(created_at: :desc)
    end

    def create
        file_to_upload = current_user.documents.create(file_params)
        file_to_upload.filename = file_params["file"].original_filename
        file_to_upload.save
        redirect_to root_path
    end

    def destroy
        @document = current_user.documents.find_by!(key: params[:id])
        @document && @document.file.purge_later
        @document && @document.destroy
        redirect_to root_path
    end

    private
    def file_params
        params.require(:document).permit(:file).merge(key: "#{Time.now.to_i}")
    end

end