class Api::V1::CvsController < Api::V1::BaseController
	
	def create
		params.permit!

		cv = Cv.new
		cv.info_usuario = InfoUsuario.new(params[:cv][:info_usuario])  if params[:cv][:info_usuario]
		cv.info_pessoal = InfoPessoal.new(params[:cv][:info_pessoal])  if params[:cv][:info_pessoal]
		params[:cv][:info_academicas].each { |info| cv.info_academicas << InfoAcademica.new(info) } if params[:cv][:info_academicas]
		params[:cv][:info_profissionals].each { |info| cv.info_profissionals << InfoProfissional.new(info) }
		params[:cv][:cursos].each { |info| cv.cursos << Curso.new(info) }
		params[:cv][:qualificacaos].each { |info| cv.qualificacaos << Qualificacao.new(info) }

		cv.save

		if cv.valid?
			respond_with(cv, :location => api_v1_cv_path(cv))
		else
			respond_with(cv)
		end

	end
  
  def destroy
    cv = Cv.find(params[:id])
    cv.destroy

    respond_with(cv)
  end


  def show
  	cv = Cv.find(params[:id])

    respond_to { |format|
		format.json { render :json => cv.to_json(:include => {
			:info_usuario => {:except => [:senha]},
			:info_pessoal  => {},
			:info_academicas  => {},
			:info_profissionals => {:include => :atividades},
			:cursos  => {},
			:qualificacaos  => {}
		})}
	}
  end


end