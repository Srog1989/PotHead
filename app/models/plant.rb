class Plant < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :name, :light_needs, :water_needs
end
