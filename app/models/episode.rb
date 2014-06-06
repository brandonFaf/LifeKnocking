class Episode < ActiveRecord::Base
	has_many :photos
	has_many :extras
	belongs_to :podcast
end
