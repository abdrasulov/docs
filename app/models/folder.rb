class Folder < ActiveRecord::Base
  has_many :documents
end
