require 'rails_helper'

describe '/api/v1/cvs/info_usuarios', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_usuarios" }
  	
  	it "atualizando uma informacao de usuario" do
  		info_usuario = cv.info_usuario
  		info_usuario.login = 'loguinho.loco'
  		
  		put "#{url}/#{info_usuario.id}.json", :info_usuario => {
  			:login => info_usuario.login,
  			:email => info_usuario.email
   		}

   		puts "Response #{last_response.body}"
   		#info_usuario_json = JSON.parse last_response.body
   		#info_usuario_json["id"].should be
   		last_response.status.should eql(204)
  	end

  	it "obtendo uma informacao de usuario" do
  		info_usuario = cv.info_usuario

  		get "#{url}/#{info_usuario.id}.json"

  		info_usuario_json = JSON.parse last_response.body
   		info_usuario_json["id"].should be
   		last_response.status.should eql(200)
  	end

end