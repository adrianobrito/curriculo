class Api::V1::InfoUsuariosController < Api::V1::BaseController

	def update
		info_usuario = InfoUsuario.find(params[:id])
		if info_usuario.update_attributes(params[:info_usuario])
			respond_with(info_usuario, :location => api_v1_cv_info_usuario_path(info_usuario.cv, info_usuario))
		else
			respond_with(info_usuario)
		end
	end

	def show
		info_usuario = InfoUsuario.find(params[:id])
		respond_with(info_usuario)
	end

end