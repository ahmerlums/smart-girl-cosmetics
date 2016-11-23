class Product < ActiveRecord::Base
    mount_uploader :pictures, AttachmentUploader
    serialize :feature,Array
    validates_presence_of :tittle
    validates_presence_of :category
    validates_presence_of :popularity
    validates_presence_of :features
    def self.search(search)
def self.search(search)
  if search
    self.where("tittle like ?", "%#{search}%")
  else
    self.all
  end
end
end
end
