class Purchase < ApplicationRecord
  
    belongs_to    :item
    has_one       :delivery
    belongs_to    :user
    
    end
    

