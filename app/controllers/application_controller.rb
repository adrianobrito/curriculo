class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	def options
  		headers['Access-Control-Allow-Credentials'] = 'true'
  		headers['Access-Control-Allow-Origin'] = '*'
	  	headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS, DELETE, PUT'
	  	headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'

	  	render :text => '', :content_type => 'text/plain'
  	end

end
