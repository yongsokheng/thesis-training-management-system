class Document < ActiveRecord::Base
  mount_uploader :content, DocumentUploader

  belongs_to :documentable, polymorphic: true
end
