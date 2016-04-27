ActiveAdmin.register Document do
  config.filters = false
  belongs_to :folder
  actions :all, except: [:show, :edit, :update]

  permit_params :name, :file

  index do
    column :name do |doc|
      doc.file_file_name
    end
    actions defaults: false do |doc|
      item fa_icon('download'), doc.file.url, class: 'member_link'
      item fa_icon('trash'), admin_folder_document_path(doc.folder, doc), method: :delete, class: 'member_link'
    end

  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :file, as: :file
    end
    f.actions
  end

end
