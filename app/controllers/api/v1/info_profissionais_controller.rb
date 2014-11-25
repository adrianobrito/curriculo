class Api::V1::InfoProfissionaisController < Api::V1::BaseController

	def update
		info_profissional = InfoProfissional.find(params[:id])
		info_profissional.update_attributes(params[:info_profissional])
		respond_put(info_profissional)
	end

	def create
		info_profissional = InfoProfissional.create(params[:info_profissional])
		
		if info_profissional.valid?
			respond_with(info_profissional, :location => api_v1_cv_info_profissional_path(info_profissional.cv, info_profissional))
		else
			respond_with(info_profissional)
		end
	end

	def show
		info_profissional = InfoProfissional.find(params[:id])
		respond_with(info_profissional)
	end

	def destroy
		info_profissional = InfoProfissional.find(params[:id])
		info_profissional.destroy

		respond_with(info_profissional)
	end	

end