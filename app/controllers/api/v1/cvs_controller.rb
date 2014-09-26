class Api::V1::CvsController < Api::V1::BaseController
	
	def create
		params.permit!

		cv = Cv.new
		cv.info_usuario = InfoUsuario.new(params[:cv][:info_usuario])
		cv.info_pessoal = InfoPessoal.new(params[:cv][:info_pessoal])
		params[:cv][:info_academicas].each { |info| cv.info_academicas << InfoAcademica.new(info) }
		params[:cv][:info_profissionals].each { |info| cv.info_profissionals << InfoProfissional.new(info) }
		params[:cv][:cursos].each { |info| cv.cursos << Curso.new(info) }
		params[:cv][:qualificacaos].each { |info| cv.qualificacaos << Qualificacao.new(info) }

		cv.save
		puts "SAVED - #{cv.inspect}" 

		if cv.valid?
			respond_with(cv, :location => api_v1_cv_path(cv))
		else
			respond_with(cv)
		end

	end

end