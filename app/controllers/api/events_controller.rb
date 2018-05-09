class API::EventsController < ApplicationController 
  skip_before_action :verify_authenticity_token, :authenticate_user!
  before_action :set_access_control_headers 

  def create 
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if registered_application nil? 
      render json: 'Unregistered application', status: :unprocessable_entity
    else 
      @event = registered_application.event.new(event_params)
      if @event.save
        render json: @event, status: :created 
      else 
        render json: { errors: @event.errors }, status: :unprocessable_entity
      end 
    end 
  end 

  private 

  def preflight 
    head 200 
  end 

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end 

  def event_params 
    params.require(:event).permit(:name)
  end 
end 