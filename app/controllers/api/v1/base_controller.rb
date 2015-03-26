class Api::V1::BaseController < ActionController::Base
	respond_to :json
	
	before_filter :permitir_parametros
	after_filter :cors_set_access_control_headers

	# For all responses in this controller, return the CORS access control headers.
	def cors_set_access_control_headers
	  headers['Access-Control-Allow-Origin'] = '*'
	  headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS, DELETE, PUT'
	  headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
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