class News < ActiveRecord::Base
  belongs_to :source
  
  def self.update_from_feed(source)
    feed = Feedjira::Feed.fetch_and_parse(source.uri)
    add_entries(feed.entries, source.id)
  end
  
  def self.full_update
    Source.all.each do |source|
      feed = Feedjira::Feed.fetch_and_parse(source.uri)
      add_entries(feed.entries, source.id)
    end
  end
  
  def self.search(search)
    where("body LIKE ? or title LIKE ?", "%#{search}%", "%#{search}%")
  end
        
  private
  
  def self.add_entries(entries, source_id)
    entries.each do |entry|
      unless exists?(guid: entry.id)
        create!(
          title:     entry.title, 
          body:      entry.summary, 
          content:   entry.content,
          source_id: source_id,
          date:      entry.published,
          guid:      entry.id,
          url:       entry.url
        )
      end
    end
  end
  
  def self.by_date
    order('date desc')
  end
  
  def self.latest
    by_date.limit(1)
  end
end
