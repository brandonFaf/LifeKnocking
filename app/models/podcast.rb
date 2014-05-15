class Podcast < ActiveRecord::Base
require 'rss/2.0'
require 'rss/itunes'
	has_attached_file 	:audio,
						:storage => :s3,
						:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
						:path => ":attachment/:id/:style.:extension",
						:bucket => 'LifeKnocking'

	validates_attachment :audio, content_type: { content_type: "audio/mp3"}

	def s3_credentials
    	{:bucket => "LifeKnocking", :access_key_id =>  ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"]}
  	end

#  def self.rss

#     author = "Life Knocking"
   
#     rss = RSS::Rss.new("2.0")
#     channel = RSS::Rss::Channel.new
   
#     # category = RSS::ITunesChannelModel::ITunesCategory.new("Arts")
#     # category.itunes_categories <<   \
#     #                 RSS::ITunesChannelModel::ITunesCategory.new("Literature")
#     # channel.itunes_categories << category
   
#     channel.title = "Life Knocking"
#     channel.description = "This is a podcast where three friends come together and talk about things, and stuff"
#     channel.link = 'http://life-knocking.herokuapp.com'
#     channel.language = "en-us"
#     channel.copyright = "Copyright #{Date.today.year} I Own This"
#     #channel.lastBuildDate = Podcast.last_modified.updated_at
#     # the above uses a method I built on the Audio model that finds 
#     # the last modified file and makes that the build date for the 
#     # whole podcast channel

#     # below is your "album art"
#     channel.image = RSS::Rss::Channel::Image.new
# #channel.image.url = "http://www.example.com/images/app_rss_logo.jpg"
#     channel.image.title = channel.title
#     channel.image.link = channel.link

#     #channel.itunes_author = author
#     channel.itunes_owner = RSS::ITunesChannelModel::ITunesOwner.new
#     channel.itunes_owner.itunes_name = author
#     channel.itunes_owner.itunes_email = 'lifeknocking@aol.com'

# #channel.itunes_keywords = %w(Common Misspellings of Key Words)

#     channel.itunes_subtitle = "This is a podcast where three friends come together and talk about things, and stuff"             
# channel.itunes_summary = "This is a podcast where three friends come together and talk about things, and stuff"

#      # below is what iTunes uses for your "album art", different from RSS standard
# #channel.itunes_image = RSS::ITunesChannelModel::ITunesImage.new("/path/to/logo.png")
#     channel.itunes_explicit = "No"
#     # above could also be "Yes" or "Clean"

#     Podcast.all.each do |pod|
#       item = RSS::Rss::Channel::Item.new
#       item.title = pod.title
#       link = pod.audio.url
#       item.link = link
#       #item.itunes_keywords = %w(Keywords For This Particular Audio Clip)
#       item.guid = RSS::Rss::Channel::Item::Guid.new
#       item.guid.content = link
#       item.guid.isPermaLink = true
#       item.pubDate = pod.updated_at
     
#       description = pod.description

#       item.description = description
#       item.itunes_summary = description
# #item.itunes_subtitle = pod.nice_title
#       item.itunes_explicit = "No"
#       item.itunes_author = author
     
#       # TODO can add duration once we can compute that somehow
     
#       item.enclosure = \
#             RSS::Rss::Channel::Item::Enclosure.new(pod.audio.url, pod.audio_file_size, pod.audio_file_size)     
#       channel.items << item
       
#       end

#     rss.channel = channel
#     rss.to_xml
   
#   end

end
