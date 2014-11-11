class Api::V1::InfoProfissionaisController < Api::V1::BaseController

	def update
		info_profissional = InfoProfissional.find(params[:id])
		info_profissional.update_attributes(params[:info_profissional])
		respond_put(info_profissional)
	end


end