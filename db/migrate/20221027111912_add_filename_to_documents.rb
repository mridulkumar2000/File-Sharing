class AddFilenameToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :file_name, :string
  end
end
