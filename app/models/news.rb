class News < ActiveRecord::Base
  belongs_to :source
  
  def self.update_from_feed(source)
    feed = Feedjira::Feed.fetch_and_parse source.uri
    feed.entries.each do |entry|
      unless exists?(guid: entry.id)
        create!(
          title:     entry.title, 
          body:      entry.summary, 
          source_id: source.id, 
          date:      entry.published,
          guid:      entry.id,
          url:       entry.url
        )
      end
    end
  end
end
