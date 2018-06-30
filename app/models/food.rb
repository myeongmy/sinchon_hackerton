class Food < ActiveRecord::Base
      validates_presence_of :fname, :material1, :material2
    searchable do
        text :material1, :material2
        
    end
end
