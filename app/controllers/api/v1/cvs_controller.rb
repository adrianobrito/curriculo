class Api::V1::CvsController < Api::V1::BaseController
	def create
		puts "JSON: #{params[:cv]}"
		cv = Cv.create(cv_params)
		
		if cv.valid?
			respond_with(cv, :location => api_v1_cv_path(cv))
		else
			respond_with(cv)
		end

	end

	private
		def cv_params
	    	params.require(:cv).permit(:info_pessoal, :info_usuario, :info_academicas, :info_profissionais, :cursos, :qualificacaos)
	    end

end