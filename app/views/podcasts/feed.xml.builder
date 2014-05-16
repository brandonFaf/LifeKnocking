title = "Life Knocking"
description = "This is a podcast where three friends come together and talk about things, and stuff"
author = "Life Knocking"
keywords = "life, knocking, friends, fun, stories, sushi, skydiving"
image = "http://s3.amazonaws.com/LifeKnocking/pics/KTBPresents.jpeg"


xml.instruct! :xml, :version => "1.0" 
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", :version => "2.0" do
  xml.channel do
    xml.title title
    xml.description description
    xml.image do
      xml.title title
      xml.url image
      xml.link podcasts_url
    end
    xml.language "en-us"
    xml.copyright "Copyright #{Date.today.year} I Own This"
    xml.lastBuildDate Podcast.last.updated_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :subtitle, description[0..254]
    xml.itunes :summary, description
    xml.itunes :image, href: image
    xml.itunes :explicit, "no"
    xml.itunes :category, text: "Kids & Family"
    xml.itunes :category, text: 'Comedy'
     xml.itunes :owner do
      xml.itunes :email, "LifeKnocking@aol.com"
      xml.itunes :name, "Brandon Myers"
    end 
    xml.link podcasts_url
    for pod in @pods
      xml.item do
        xml.title pod.title
        xml.description pod.description
        xml.link pod.audio.url
        xml.pubDate pod.created_at.to_s(:rfc822)
        xml.itunes :image, href: image
        xml.itunes :summary, pod.description
        xml.itunes :author, author
        xml.itunes :explicit, "no"
        xml.itunes :subtitle, pod.description[0..254] 
        xml.enclosure :url => pod.audio.url, :length => pod.audio_file_size, :type => 'audio/mpeg'
      end
    end
   

  end
end