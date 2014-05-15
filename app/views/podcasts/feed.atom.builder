atom_feed do |feed|
    feed.title("My great blog!")
    feed.updated(@pods[0].created_at) if @pods.length > 0

    @pods.each do |post|
      feed.entry(post) do |entry|
        entry.title(post.title)
        entry.content(post.description, type: 'html')

        entry.author do |author|
          author.name("DHH")
        end
      end
    end
  end