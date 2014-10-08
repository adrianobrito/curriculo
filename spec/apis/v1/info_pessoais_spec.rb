require 'rails_helper'

describe '/api/v1/cvs/info_pessoais', :type => :api do
	
	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_pessoais" }

	it "atualizando uma informacao pessoal" do
		info_pessoal = cv.info_pessoal
		novo_nome = 'Adriano Brito Bispo'

  		put "#{url}/#{info_pessoal.id}.json", :info_pessoal => FactoryGirl.attributes_for(:info_pessoal)
  																		  .merge({
  																		  		:id => info_pessoal.id,
  																		  		:cv_id => cv.id,
  																		  		:nome => novo_nome
  																		   })

  		info_pessoal = JSON.parse last_response.body 	

		info_pessoal["id"].should be
		info_pessoal["nome"].should eql novo_nome
		last_response.status.should eql(200)
	end

	it "disparando erro ao atualizar uma informação de usuário com dados invalidos" do
		info_pessoal = cv.info_pessoal
		novo_nome = 'Adriano Brito Bispo'

  		put "#{url}/#{info_pessoal.id}.json", :info_pessoal => FactoryGirl.attributes_for(:info_pessoal)
  																		  .merge({
  																		  		:id => info_pessoal.id,
  																		  		:cv_id => cv.id,
  																		  		:nome => nil
  																		   })
		last_response.status.should eql(422)
	end

	it "obtendo uma informacao de usuario" do
  		info_pessoal = cv.info_pessoal

  		get "#{url}/#{info_pessoal.id}.json"

  		info_pessoal_json = JSON.parse last_response.body
   		info_pessoal_json["id"].should be
   		last_response.status.should eql(200)
  	end

end