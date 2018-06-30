class Food < ActiveRecord::Base
    mount_uploader :image, ImageUploader
      validates_presence_of :fname, :material1, :material2
    searchable do
        text :material1, :material2
        
    end
end
