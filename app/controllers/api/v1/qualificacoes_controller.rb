class Api::V1::QualificacoesController < Api::V1::BaseController

	def update
		qualificacao = Qualificacao.find(params[:id])
		qualificacao.update_attributes(params[:qualificacao])
		respond_put(qualificacao)
	end

	def create
		qualificacao = Qualificacao.create(params[:qualificacao])
		
		if qualificacao.valid?
			respond_with(qualificacao, :location => api_v1_cv_qualificacao_path(qualificacao.cv, qualificacao))
		else
			respond_with(qualificacao)
		end
	end
	
	def destroy
		qualificacao = Qualificacao.find(params[:id])
		qualificacao.destroy

		respond_with(qualificacao)
	end

	def show
		qualificacao = Qualificacao.find(params[:id])
		respond_with(qualificacao)
	end

end