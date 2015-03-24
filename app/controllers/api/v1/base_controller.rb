class Api::V1::BaseController < ActionController::Base
	respond_to :json
	
	before_filter :permitir_parametros
	before_filter :cors_preflight_check
 	after_filter :cors_set_access_control_headers
 
 	def cors_set_access_control_headers
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
	    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
	    headers['Access-Control-Max-Age'] = "1728000"
	end
 
	def cors_preflight_check
		if request.method == 'OPTIONS'
		  headers['Access-Control-Allow-Origin'] = '*'
		  headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		  headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
		  headers['Access-Control-Max-Age'] = '1728000'

		  render :text => '', :content_type => 'text/plain'
		end
	end

  	def permitir_parametros
  		params.permit!
  	end

  	def respond_put(model)
  		respond_with(model) do |format|
			format.json {
			    if model.valid?
			      render json: model
			    else
			      render json: model.errors, status: :unprocessable_entity
			    end
			}
		end
  	end

  	def respond_with_errors(errors)
  		 render json: {:errors => errors }, status: :unprocessable_entity
  	end

end