class Episode < ActiveRecord::Base
	has_many :photos
	belongs_to :podcast
end
