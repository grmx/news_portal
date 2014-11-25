class NewsController < ApplicationController
  def index
    @sources = Source.all
  end
  
  def refresh_all
    @news = News.all
    @news.full_update
    redirect_to root_path
  end
end
