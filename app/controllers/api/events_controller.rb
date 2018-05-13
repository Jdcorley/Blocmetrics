class API::EventsController < ApplicationController 
  before_action :set_access_control_headers
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def create 
    are_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if are_application.nil?
      Rails.logger.info('got here')
      render json: 'Unregistered application', status: :unprocessable_entity
    else
      Rails.logger.info('got here 2')
      @event = are_application.events.new(event_params)
      if @event.save
        render json: @event, status: :created 
      else 
        render json: { errors: @event.errors }, status: :unprocessable_entity
      end 
    end 
  end 

  def preflight 
    head 200 
  end 

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
  end 

  def event_params 
    params.require(:event).permit(:name)
  end 
end 