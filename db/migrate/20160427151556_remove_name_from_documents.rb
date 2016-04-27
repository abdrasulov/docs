class RemoveNameFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :name
  end
end
