class Plant < ActiveRecord::Base
    belongs_to :user

    validates :name, :light_needs, :water_needs, presence: true
end
