class Api::V1::InfoAcademicasController < Api::V1::BaseController

	def update
		info_academica = InfoAcademica.find(params[:id])
		info_academica.update_attributes(params[:info_academica])
		respond_put(info_academica)
	end

	def create
		info_academica = InfoAcademica.create(params[:info_academica])
		
		if info_academica.valid?
			respond_with(info_academica, :location => api_v1_cv_info_academica_path(info_academica.cv, info_academica))
		else
			respond_with(info_academica)
		end
	end
	
	def destroy
		info_academica = InfoAcademica.find(params[:id])
		info_academica.destroy

		respond_with(info_academica)
	end

	def show
		info_academica = InfoAcademica.find(params[:id])
		respond_with(info_academica)
	end

end