class Bug < ActiveRecord::Base
validates :name, presence: true 
validates :title, presence: true 
validates :description, presence: true 
validates :platform, presence: true 
end
