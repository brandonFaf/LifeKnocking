class Extra < ActiveRecord::Base
	has_one :podcast, through: :episode
	belongs_to :episode
end
