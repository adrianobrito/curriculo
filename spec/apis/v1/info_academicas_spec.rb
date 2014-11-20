require 'rails_helper'

describe '/api/v1/cvs/info_academicas', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_academicas" }

	it "atualizando uma informação academica" do
		info_academica = cv.info_academicas[0]
		novo_curso = 'um curso ai'

		put "#{url}/#{info_academica.id}.json",
			:info_academica => FactoryGirl.attributes_for(:info_academica)
										  .merge({
										  		:id => info_academica.id,
										  		:cv_id => cv.id,
										  		:curso => novo_curso
										   })

		info_academica = JSON.parse last_response.body
		
		info_academica["id"].should be
		info_academica["curso"].should eql novo_curso
		last_response.status.should eql(200)
	end

	it "erro ao atualizar uma informação academica" do
		info_academica = cv.info_academicas[0]
		
		put "#{url}/#{info_academica.id}.json",
			:info_academica => FactoryGirl.attributes_for(:info_academica)
										  .merge({
										  		:id => info_academica.id,
										  		:cv_id => cv.id,
										  		:curso => nil
										   })
		
		last_response.status.should eql(422)
	end

	it "adicionando uma informação acadêmica" do
		quantidade_antiga = InfoAcademica.where(:cv_id => cv.id).count
		info_academica = FactoryGirl.attributes_for(:info_academica)
		
		post "#{url}.json",
			:info_academica => info_academica.merge(
									:cv_id => cv.id,
									:nivel => :ensino_superior_pos_graduacao
							    )

		info_academica = JSON.parse last_response.body
		quantidade_nova = InfoAcademica.where(:cv_id => cv.id).count

		quantidade_nova.should be (quantidade_antiga + 1)
		info_academica["id"].should be
		info_academica["nivel"].should eql :ensino_superior_pos_graduacao.to_s
		last_response.status.should eql(201)
	end	

	it "deve disparar um erro ao inserir informações invalidas" do
		info_academica = FactoryGirl.attributes_for(:info_academica)
		
		post "#{url}.json",
			:info_academica => info_academica.merge(
									:cv_id => cv.id,
									:nivel => nil
							    )

		last_response.status.should eql(422)
	end

	it "removendo uma informação academica" do
		info_academica = cv.info_academicas[0]

		delete "#{url}/#{info_academica.id}.json"
		info_academica_deletada = InfoAcademica.find_by(:id => info_academica.id)

		info_academica_deletada.should be nil
		last_response.status.should eql(204)
	end

	it "obtendo uma informação profissional" do
		info_academica = cv.info_academicas[0]
		get "#{url}/#{info_academica.id}.json"

		info_academica_json = JSON.parse last_response.body

		last_response.status.should eql(200)
		info_academica_json["id"].should eql info_academica.id
	end


end