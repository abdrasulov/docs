ActiveAdmin.register Document do
  config.filters = false
  belongs_to :folder
  actions :all, except: [:show]

  permit_params :name, :file, :folder_id

  index do
    column :name do |doc|
      doc.file_file_name
    end
    actions defaults: false do |doc|
      item fa_icon('download'), doc.file.url, class: 'member_link'
      item fa_icon('edit'), edit_folder_document_path(doc.folder, doc), class: 'member_link'
      item fa_icon('trash'), folder_document_path(doc.folder, doc), method: :delete, class: 'member_link'
    end

  end

  form do |f|
    f.semantic_errors
    f.inputs do
      if f.object.new_record?
        f.input :file, as: :file
      else
        f.input :folder
      end
    end
    f.actions
  end

end
