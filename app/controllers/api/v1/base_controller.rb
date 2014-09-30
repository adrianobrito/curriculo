class Api::V1::BaseController < ActionController::Base
	respond_to :json
	before_filter :permitir_parametros
  	
  	def permitir_parametros
  		params.permit!
  	end

end