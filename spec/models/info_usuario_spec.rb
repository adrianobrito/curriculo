require 'rails_helper'
require 'digest'

describe InfoUsuario, :type => :model do

	it "deve ser valido" do
		usuario = create_info_usuario

		usuario.should be_valid
		usuario.cv.should be
	end

	it "deve ser invalido sem email" do
		usuario = create_info_usuario({:email => nil})

		usuario.should be_invalid
	end

	it "deve ser invalido sem senha" do
		usuario = create_info_usuario({:senha => nil})

		usuario.should be_invalid
	end

	it "deve ser invalido sem cv" do
		usuario = create_info_usuario({:cv_id => nil})

		usuario.should be_invalid
		usuario.cv.should be nil
	end

	it "deve ter a senha criptografada com md5" do
		usuario = create_info_usuario({:senha => "modafoca"});
		md5Senha = Digest::MD5.new
		md5Senha.update 'modafoca'

		senha_md5 = md5Senha.to_s
		md5Senha.update usuario.senha
		senha_usuario = md5Senha.to_s

		senha_usuario.should == md5Senha.to_s
	end

	it "não deve salvar com email invalido" do
		usuario = create_info_usuario({:email => "adrianosdebu"})

		usuario.should be_invalid
	end

	private 
		def create_info_usuario(option = {})
			cv = Cv.create
			InfoUsuario.create({
				:email => "adrianosdebrito@gmail.com",
				:senha => "modafoca",
				:cv_id => cv.id
			}.merge(option))
		end

end
