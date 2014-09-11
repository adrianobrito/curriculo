class InfoUsuario < ActiveRecord::Base
	include ActiveModel::Validations

	belongs_to :cv
	validates_presence_of :login, :email, :senha, :cv_id
	validates :email, :email => true
	before_save  :criptografar_senha


	def criptografar_senha
		md5Senha = Digest::MD5.new
		self.senha = md5Senha.to_s
	end

end
