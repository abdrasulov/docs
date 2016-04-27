class Folder < ActiveRecord::Base
  has_many :documents, dependent: :destroy
  validates_uniqueness_of :name
end
