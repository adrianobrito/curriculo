class Api::V1::InfoUsuariosController < Api::V1::BaseController

	def update
		info_usuario = InfoUsuario.find(params[:id])
		info_usuario.update_attributes(params[:info_usuario])
		respond_put(info_usuario)
	end

	def show
		info_usuario = InfoUsuario.find(params[:id])
		respond_with(info_usuario)
	end
	
	def autenticar
		info_usuario = InfoUsuario.find_by(params[:info_usuario])

		if info_usuario
			respond_with(info_usuario)
		else
			respond_with_errors(['Login ou senha inválidos'])
		end
	end

end