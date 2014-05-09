class Photo < ActiveRecord::Base
  has_attached_file :pic, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  bucket: 'LifeKnocking',
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  :path => ":attachment/:id/:style.:extension"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    	{:bucket => "LifeKnockingTest", :access_key_id =>  ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"]}
  end
end
