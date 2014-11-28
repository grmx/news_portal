class SourcesController < ApplicationController
  before_action :auth_user, except: [:show]
  before_action :get_source, only: [:show, :edit, :update, :destroy, :refresh]

  def index
    @sources = Source.all
  end
  
  def show
    @source_news = @source.news.by_date.paginate(page: params[:page],
                                                 per_page: 10)
  end
  
  def new
    @source = Source.new
  end
  
  def create
    @source = Source.new(source_params)
    if @source.save
      News.update_from_feed(@source)
      redirect_to @source, notice: "The source successfully added."
    else
      flash.now[:alert] = "The form contains some errors!"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @source.update(source_params)
      redirect_to @source, notice: "The source successfully updated."
    else
      flash.now[:alert] = "The form contains some errors!"
      render :new
    end
  end
  
  def destroy
    @source.destroy
    redirect_to sources_path, notice: "Source deleted."
  end
  
  def refresh
    @source.news.update_from_feed(@source)
    redirect_to @source
  end
  
  private
  
  def source_params
    params.require(:source).permit(:title, :description, :uri)
  end
  
  def get_source
    @source = Source.find(params[:id])
  end
end
