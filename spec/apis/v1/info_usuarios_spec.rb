require 'rails_helper'

describe '/api/v1/cvs/info_usuarios', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_usuarios" }
  let(:loginUrl) { "/api/v1/login" }
  	
  	it "atualizando uma informacao de usuario" do
  		info_usuario = cv.info_usuario
  		info_usuario.login = 'loguinho.loco'
  		
  		put "#{url}/#{info_usuario.id}.json", :info_usuario => {
  			:login => info_usuario.login,
  			:email => info_usuario.email
   		}

   		info_usuario_json = JSON.parse last_response.body
   		info_usuario_json["id"].should be
   		last_response.status.should eql(200)
  	end

  	it "erro ao atualizar uma informação de usuário com dados invalidos" do
  		info_usuario = cv.info_usuario
  		info_usuario.login = 'loguinho.loco'
  		
  		put "#{url}/#{info_usuario.id}.json", :info_usuario => {
  			:login => "",
  			:email => info_usuario.email
   		}

   		last_response.status.should eql(422)
  	end

    it "deve autenticar um usuário com base no usuário e na senha" do
      info_usuario = cv.info_usuario

      get "#{loginUrl}.json", :info_usuario => {
        :login => info_usuario.login,
        :senha => info_usuario.senha
      }

      info_usuario_json = JSON.parse last_response.body
      info_usuario_json["id"].should be
      last_response.status.should eql(200)
    end

    it "deve retornar nulo um usuário com base no usuário e na senha errados" do
      info_usuario = cv.info_usuario

      get "#{loginUrl}.json", :info_usuario => {
        :login => nil,
        :senha => info_usuario.senha
      }

      error = JSON.parse last_response.body

      error["errors"].should be
      last_response.status.should eql(422)
    end

  	it "obtendo uma informacao de usuario" do
  		info_usuario = cv.info_usuario

  		get "#{url}/#{info_usuario.id}.json"

  		info_usuario_json = JSON.parse last_response.body
   		info_usuario_json.should be
   		last_response.status.should eql(200)
  	end

end