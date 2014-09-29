require 'rails_helper'

describe '/api/v1/cvs', :type => :api do

	let(:url) { "/api/v1/cvs" }
  let(:cv) { FactoryGirl.create(:cv) }

	it "criando um cv" do
		
		post "#{url}.json",  :cv => {
			:info_usuario => FactoryGirl.attributes_for(:info_usuario),
			:info_pessoal => FactoryGirl.attributes_for(:info_pessoal),
			:info_academicas => [FactoryGirl.attributes_for(:info_academica)],
			:info_profissionals => [FactoryGirl.attributes_for(:info_profissional)
										       .merge({:atividades_attributes => [FactoryGirl.attributes_for(:atividade)]})],
			:qualificacaos => [FactoryGirl.attributes_for(:qualificacao)],
			:cursos => [FactoryGirl.attributes_for(:curso)]
		}
		
		
		cv = JSON.parse last_response.body 

		cv["id"].should be 
		last_response.status.should eql(201)
	end
  
  it "erro ao criar cv invalido" do
    post "#{url}.json",  :cv => {
      :info_usuario => FactoryGirl.attributes_for(:info_usuario).merge({ :email => nil }),
      :info_pessoal => {},
			:info_academicas => [FactoryGirl.attributes_for(:info_academica)],
			:info_profissionals => [FactoryGirl.attributes_for(:info_profissional)
										       .merge({:atividades_attributes => [FactoryGirl.attributes_for(:atividade)]})],
			:qualificacaos => [FactoryGirl.attributes_for(:qualificacao)],
			:cursos => [FactoryGirl.attributes_for(:curso)]
		}
    
    last_response.status.should eql(422)
  end
  
  it "deve deletar um cv" do
    delete "#{url}/#{cv.id}.json"
    
    cv_deleted = Cv.find(cv.id)
    
    cv_deleted.should be nil
    last_response.status.should eql(201)
  end


end