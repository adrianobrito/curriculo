require 'rails_helper'

describe '/api/v1/cvs/info_profisionais', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_profissionais" }

	it "atualizando uma informação profissional" do
		info_profissional = cv.info_profissionals[0]
		nova_empresa = "NOVA"

		put "#{url}/#{info_profissional.id}.json", 
			 :info_profissional => FactoryGirl.attributes_for(:info_profissional)
			 								  .merge({
			 								  		:id => info_profissional.id,
			 								  		:cv_id => cv.id,
			 								  		:empresa => nova_empresa
			 								   })

		info_profissional = JSON.parse last_response.body 	

		info_profissional["id"].should be
		info_profissional["empresa"].should eql nova_empresa
		last_response.status.should eql(200)

	end

	it "editar uma atividade de uma informação profissional" do
		info_profissional = cv.info_profissionals[0]
		atividade = info_profissional.atividades[0]
		atividade.descricao = 'Atividade do Mal'

		put "#{url}/#{info_profissional.id}.json", 
			 :info_profissional => FactoryGirl.attributes_for(:info_profissional)
			 								  .merge({
			 								  		:id => info_profissional.id,
			 								  		:cv_id => cv.id,
			 								  		:atividades_attributes => [ {:id => atividade.id,
			 								  						  :descricao => atividade.descricao} ]
			 								   })

		info_profissional = InfoProfissional.find_by(:id => info_profissional.id)

		info_profissional.atividades[0].descricao.should eql('Atividade do Mal')
		last_response.status.should eql(200)
	end

	it "deve disparar um erro ao atualizar com informações invalidas" do
		info_profissional = cv.info_profissionals[0]
		
		put "#{url}/#{info_profissional.id}.json", 
			 :info_profissional => FactoryGirl.attributes_for(:info_profissional)
			 								  .merge({
			 								  		:id => info_profissional.id,
			 								  		:cv_id => cv.id,
			 								  		:empresa => nil
			 								   })

		last_response.status.should eql(422)
	end

	it "adicionando uma informação profissional" do

		quantidade_antiga = InfoProfissional.where(:cv_id => cv.id).count
		info_profissional = FactoryGirl.attributes_for(:info_profissional)
									   .merge({:atividades_attributes => [FactoryGirl.attributes_for(:atividade)]})
		novo_cargo = "Gari"

		post "#{url}.json",
			 :info_profissional => info_profissional.merge({
			 	:cv_id => cv.id,
			 	:cargo => novo_cargo
			 })

		info_profissional = JSON.parse last_response.body
		quantidade_nova = InfoProfissional.where(:cv_id => cv.id).count

		quantidade_nova.should be (quantidade_antiga + 1)
		info_profissional["id"].should be
		info_profissional["cargo"].should eql novo_cargo
		last_response.status.should eql(201)
	end

	it "deve disparar um erro ao inserir informações invalidas" do
		info_profissional = FactoryGirl.attributes_for(:info_profissional)
									   .merge({:atividades_attributes => [FactoryGirl.attributes_for(:atividade)]})

		post "#{url}.json",
			 :info_profissional => info_profissional.merge({
			 	:cv_id => cv.id,
			 	:cargo => nil
			 })

		last_response.status.should eql(422)
	end

	it "removendo uma informação profissional" do
		info_profissional = cv.info_profissionals[0]

		delete "#{url}/#{info_profissional.id}.json"
		info_profissional_deletada = InfoProfissional.find_by(:id => info_profissional.id)

		info_profissional_deletada.should be nil
		last_response.status.should eql(204)
	end

	it "obtendo uma informação profissional" do
		info_profissional = cv.info_profissionals[0]
		get "#{url}/#{info_profissional.id}.json"

		info_profissional_json = JSON.parse last_response.body

		last_response.status.should eql(200)
		info_profissional_json["id"].should eql info_profissional.id
	end

end