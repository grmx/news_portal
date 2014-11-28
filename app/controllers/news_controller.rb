class NewsController < ApplicationController
  def index
    @sources = Source.all
  end

  def show
    @news = News.find(params[:id])
  end

  def search
    @news = News.search(params[:search]).by_date.paginate(page: params[:page],
                                                          per_page: 10)
  end
  
  def refresh_all
    @news = News.all
    @news.full_update
    redirect_to root_path
  end
end
