class MainController < ActionController::Base
  layout 'application'
  
  def index
    @movie = params[:movie]
  end
  
  def search
  end
end