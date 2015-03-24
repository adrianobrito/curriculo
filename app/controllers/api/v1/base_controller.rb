class Api::V1::BaseController < ActionController::Base
	respond_to :json
	
	before_filter :permitir_parametros
	
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

  	def options
    	set_access_control_headers
        head :ok
    end

    private
	    def set_access_control_headers 
	      headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
	      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
	      headers['Access-Control-Max-Age'] = '1000'
	      headers['Access-Control-Allow-Headers'] = '*,x-requested-with'
	    end

end