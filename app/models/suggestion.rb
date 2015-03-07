class Suggestion < ActiveRecord::Base
validates :name, presence: true 
validates :title, presence: true 
validates :description, presence: true 
end
