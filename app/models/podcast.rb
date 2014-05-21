class Podcast < ActiveRecord::Base
	has_one :episode
	has_many :photos, through: :episode 

	has_attached_file 	:audio,
						:storage => :s3,
						:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
						:path => ":attachment/:id/:style.:extension",
						:bucket => 'LifeKnocking'

	validates_attachment :audio, content_type: { content_type: "audio/mp3"}

	def s3_credentials
    	{:bucket => "LifeKnocking", :access_key_id =>  ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"]}
  	end

end
