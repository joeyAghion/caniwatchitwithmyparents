class MainController < ActionController::Base
  layout 'application'
  
  def index
    @movie = Movie.find_by_name(params[:movie].strip) if params[:movie].present?
  end
  
  def search
    @results = []
    @query = params[:q].strip
    @results = Movie.find_matching(@query) if @query.present?
    render :layout => false
  end
end