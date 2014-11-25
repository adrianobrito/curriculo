class Api::V1::InfoPessoaisController < Api::V1::BaseController

	def update
		info_pessoal = InfoPessoal.find(params[:id])
		info_pessoal.update_attributes(params[:info_pessoal])
		respond_put(info_pessoal)
	end

	def show
		info_pessoal = InfoPessoal.find(params[:id])
		respond_with(info_pessoal)
	end

end