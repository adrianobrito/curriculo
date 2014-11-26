require 'rails_helper'
require 'digest'

describe InfoUsuario, :type => :model do

	it "deve ser valido" do
		usuario = create_info_usuario

		usuario.should be_valid
		usuario.cv.should be
	end

	it "deve ser invalido sem login" do
		usuario = create_info_usuario({:login => nil})

		usuario.should be_invalid
	end

	it "não deve válido inserir duas vezes com o mesmo login" do
		usuario = create_info_usuario({:login => 'adrianobrito'})
		usuario = create_info_usuario({:login => 'adrianobrito'})

		usuario.should be_invalid
	end

	it "deve ser invalido sem email" do
		usuario = create_info_usuario({:email => nil})

		usuario.should be_invalid
	end

	it "deve ser invalido sem senha" do
		usuario = create_info_usuario({:senha => nil})

		usuario.should be_invalid
	end

	it "deve ter a senha criptografada com md5" do
		usuario = create_info_usuario({:senha => "modafoca"});
		md5Senha = Digest::MD5.new
		md5Senha.update 'modafoca'

		senha_md5 = md5Senha.to_s
		
		usuario = InfoUsuario.find_by(:login => usuario.login)

		senha_usuario = usuario.senha
		senha_usuario.should == md5Senha.to_s
	end

	it "não deve salvar com email invalido" do
		usuario = create_info_usuario({:email => "adrianosdebu"})

		usuario.should be_invalid
	end

	it "deve ser possivel relacionar um usuario a um cv" do
		cv = FactoryGirl.create(:cv)
		info_usuario = InfoUsuario.new({
			:login => 'adrianobrito1',
			:email => "adrianosdebrito1@gmail.com",
			:senha => "modafoca",
			:cv_id => cv.id
		})

		cv.info_usuario = info_usuario
		cv.save

		cv.info_usuario.id.should be
	end

	private 
		def create_info_usuario(option = {})
			cv = FactoryGirl.create(:cv)
			InfoUsuario.create({
				:login => 'adrianobrito1',
				:email => "adrianosdebrito1@gmail.com",
				:senha => "modafoca",
				:cv_id => cv.id
			}.merge(option))
		end

end
