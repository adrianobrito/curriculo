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

end