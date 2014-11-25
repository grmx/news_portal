class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end
  
  def show
    @source = Source.find(params[:id])
    @source_news = @source.news.by_date
  end
  
  def new
    @source = Source.new
  end
  
  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to @source, notice: "The source successfully added."
    else
      flash.now[:alert] = "The form contains some errors!"
      render :new
    end
  end
  
  def edit
    @source = Source.find(params[:id])
  end
  
  def update
    @source = Source.find(params[:id])
    if @source.update(source_params)
      redirect_to @source, notice: "The source successfully updated."
    else
      flash.now[:alert] = "The form contains some errors!"
      render :new
    end
  end
  
  def destroy
    source = Source.find(params[:id])
    source.destroy
    redirect_to sources_path, notice: "Source deleted."
  end
  
  def refresh
    source = Source.find(params[:id])
    source.news.update_from_feed(source)
    redirect_to source
  end
  
  private
  
  def source_params
    params.require(:source).permit(:title, :description, :uri)
  end
end
