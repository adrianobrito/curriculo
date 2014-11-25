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

end