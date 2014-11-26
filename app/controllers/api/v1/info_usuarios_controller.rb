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
		info_usuario = params[:info_usuario]
		info_usuario[:senha] = to_md5(info_usuario[:senha])
		
		info_usuario = InfoUsuario.find_by(info_usuario)
		
		if info_usuario
			render json: info_usuario
		else
			respond_with_errors(['Login ou senha inválidos'])
		end
	end

	def to_md5(str)
		md5Senha = Digest::MD5.new
		md5Senha.update str
		md5Senha.to_s
	end

end