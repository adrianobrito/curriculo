class Api::V1::CvsController < Api::V1::BaseController
	
	def create
		cv = Cv.new
		cv.info_usuario = InfoUsuario.new(params[:info_usuario])
		cv.info_pessoal = InfoPessoal.new(params[:info_pessoal])
		cv.info_academicas = InfoAcademica.new(params[:info_academicas])
		cv.info_profissionals = InfoProfissional.new(params[:info_profissionals])
		cv.cursos = Curso.new(params[:cursos])
		cv.qualificacaos = Qualificacao.new(params[:qualificacaos])

		cv.save
		
		if cv.valid?
			respond_with(cv, :location => api_v1_cv_path(cv))
		else
			respond_with(cv)
		end

	end

	private
		def cv_params
	    	params.require(:cv).permit!
	    end

end