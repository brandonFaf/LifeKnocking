channel = RSS::Rss::Channel.new
   
    category = RSS::ITunesChannelModel::ITunesCategory.new("Arts")
    category.itunes_categories <<   \
                    RSS::ITunesChannelModel::ITunesCategory.new("Literature")
    channel.itunes_categories << category
   
    channel.title = "Podcast Title"
    channel.description = "Podcast description, can be a paragraph"
    channel.link = "http://www.example.com/"
    channel.language = "en-us"
    channel.copyright = "Copyright #{Date.today.year} I Own This"
    channel.lastBuildDate = Audio.last_modified.updated_at
    # the above uses a method I built on the Audio model that finds 
    # the last modified file and makes that the build date for the 
    # whole podcast channel

    # below is your "album art"
    channel.image = RSS::Rss::Channel::Image.new
    channel.image.url = "http://www.example.com/images/app_rss_logo.jpg"
    channel.image.title = "Same as podcast title"
    channel.image.link = "Should be same as link for whole channel"

    channel.itunes_author = author
    channel.itunes_owner = RSS::ITunesChannelModel::ITunesOwner.new
    channel.itunes_owner.itunes_name=author
    channel.itunes_owner.itunes_email='info@example.com'

    channel.itunes_keywords = %w(Common Misspellings of Key Words)

    channel.itunes_subtitle = "This appears in the description column of iTunes"             
    channel.itunes_summary = "This appears when you click the 'circle I' button in iTunes"

     # below is what iTunes uses for your "album art", different from RSS standard
    channel.itunes_image = RSS::ITunesChannelModel::ITunesImage.new("/path/to/logo.png")
    channel.itunes_explicit = "No"
    # above could also be "Yes" or "Clean"

    Audio.find(:all).each do |audio|
      item = RSS::Rss::Channel::Item.new
      item.title = audio.title
      link = "http://www.example.com/#{audio.public_filename}"
      item.link = link
      item.itunes_keywords = %w(Keywords For This Particular Audio Clip)
      item.guid = RSS::Rss::Channel::Item::Guid.new
      item.guid.content = link
      item.guid.isPermaLink = true
      item.pubDate = audio.updated_at
     
      description = "Long description of this particular audio file, appears in circle I section of
                                iTunes"

      item.description = description
      item.itunes_summary = description
      item.itunes_subtitle = audio.nice_title
      item.itunes_explicit = "No"
      item.itunes_author = author
     
      # TODO can add duration once we can compute that somehow
     
      item.enclosure = \
            RSS::Rss::Channel::Item::Enclosure.new(item.link, audio.size, 'audio/mpeg')     
      channel.items << item
       
      end

    rss.channel = channel
    return rss.to_s
   
  end