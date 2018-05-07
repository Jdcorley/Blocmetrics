class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index 
    @applications = Application.all 
  end 

  def show
    @application = Application.find(params[:id])
  end 
  
  def new 
    @application = Application.new 
  end 
  
  def create
    @application = Application.new
    @application.assign_attributes(application_params)

    if @application.save 
      flash[:notice] = 'Your application was saved.'
      # redirect to 
    else 
      flash[:alert] = 'There was an error saving your application. 
      Please try again.'
      # redirect to 
  end

  def edit 
    @application = Application.find(params[:id])
  end 

  def update 
    @application = Application.find(params[:id])
    @application = Application.assign_attributes(application_params)
    if @application.save 
      flash[:notice] = 'Your application was saved.'
      # redirect_to
    else 
      flash.now[:alert] = 'There was an error adding your application.'
      # redirect to  
    end  
  end 

  def destroy 
    @application = Application.find(params[:id])

    if @application.destroy 
      flash[:notice] = "\'#{application.name}\' was deleted successfully."
      # redirect to 
    else 
      flash.now[:alert] = 'There was an error deleting your application.'
      # redirect to 
    end 
  end  

  private 

    def application_params 
      params.require(:name, :url)
    end 
  end
end
