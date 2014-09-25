require 'rails_helper'

describe '/api/v1/cvs', :type => :api do

	let(:url) { "/api/v1/cvs" }
	let(:cv) { FactoryGirl.build(:cv) }

	it "criando um cv" do
		
		post "#{url}.json", :info_usuario => FactoryGirl.attributes_for(:info_usuario),
			:info_pessoal => FactoryGirl.attributes_for(:info_pessoal),
			:info_academicas => [FactoryGirl.attributes_for(:info_academica)],
			:info_profissionals => [FactoryGirl.attributes_for(:info_profissional).merge({:atividades => [FactoryGirl.attributes_for(:atividade)]})],
			:qualificacaos => [FactoryGirl.attributes_for(:qualificacao)],
			:cursos => [FactoryGirl.attributes_for(:curso)]
		
		
		puts "JSON Response: #{last_response.body}"
		cv = JSON.parse last_response.body

		cv.id.should be 
		last_response.status.should eql(201)
	end


end