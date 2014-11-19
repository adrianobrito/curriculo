class Api::V1::InfoAcademicasController < Api::V1::BaseController

	def update
		info_academica = InfoAcademica.find(params[:id])
		info_academica.update_attributes(params[:info_academica])
		respond_put(info_academica)
	end


	

end