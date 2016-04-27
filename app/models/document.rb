class Document < ActiveRecord::Base
  belongs_to :folder
  has_attached_file :file
  do_not_validate_attachment_file_type :file
  validates_presence_of :folder_id

end
