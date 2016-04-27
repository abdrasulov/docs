ActiveAdmin.register Folder do
  config.filters = false
  actions :all, except: [:show]
  permit_params :name

  index do
    column :name do |folder|
      link_to folder.name, folder_documents_path(folder)
    end
    actions defaults: false do |folder|
      item fa_icon('edit'), edit_folder_path(folder), class: 'member_link'
      item fa_icon('trash'), folder_path(folder), method: :delete, class: 'member_link'
    end
  end

end
