class InfoUsuario < ActiveRecord::Base
	include ActiveModel::Validations
	validates_presence_of :email, :senha
	validates :email, :email => true
	before_save  :criptografar_senha


	def criptografar_senha
		md5Senha = Digest::MD5.new
		self.senha = md5Senha.to_s
	end

end
