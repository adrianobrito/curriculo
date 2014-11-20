require 'rails_helper'

describe '/api/v1/cvs/qualificacoes', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/qualificacoes" }

	it "atualizando um qualificacao" do
		qualificacao = cv.qualificacaos[0]
		nome_qualificacao = "qualificacao de Confeiteiro"

		put "#{url}/#{qualificacao.id}.json",
			:qualificacao => FactoryGirl.attributes_for(:qualificacao)
								 .merge({
								 		:id => qualificacao.id,
								 		:cv_id => cv.id,
								 		:descricao => nome_qualificacao
								  })

		qualificacao = JSON.parse last_response.body

		qualificacao["id"].should be
		qualificacao["descricao"].should eql(nome_qualificacao)
		last_response.status.should eql(200)
	end

	it "erro ao atualizar o qualificacao com informações invalidas" do
		qualificacao = cv.qualificacaos[0]

		put "#{url}/#{qualificacao.id}.json",
			:qualificacao => FactoryGirl.attributes_for(:qualificacao)
								 .merge({
								 		:id => qualificacao.id,
								 		:cv_id => cv.id,
								 		:descricao => nil
								  })

		last_response.status.should eql(422)
	end

	it "adicionando um qualificacao" do
		quantidade_antiga = Qualificacao.where(:cv_id => cv.id).count
		qualificacao = FactoryGirl.attributes_for(:qualificacao)

		post "#{url}.json",
			 :qualificacao => qualificacao.merge(
			 				:cv_id => cv.id,
			 				:descricao => "qualificacao de Confeitaria"
			 		   )

		qualificacao = JSON.parse last_response.body
		quantidade_nova = Qualificacao.where(:cv_id => cv.id).count

		quantidade_nova.should be (quantidade_antiga + 1)
		qualificacao["id"].should be
		qualificacao["descricao"].should eql ("qualificacao de Confeitaria")
		last_response.status.should eql(201)
	end

	it "deve disparar um erro ao inserir informações invalidas" do
		qualificacao = FactoryGirl.attributes_for(:qualificacao)

		post "#{url}.json",
			 :qualificacao => qualificacao.merge(
			 				:cv_id => cv.id,
			 				:descricao => nil
			 		   )
		last_response.status.should eql(422)
	end

	it "removendo uma informação academica" do
		curso = cv.cursos[0]

		delete "#{url}/#{curso.id}.json"
		curso_deletado = Qualificacao.find_by(:id => curso.id)

		curso_deletado.should be nil
		last_response.status.should eql(204)
	end

	it "obtendo uma informação profissional" do
		curso = cv.cursos[0]
		get "#{url}/#{curso.id}.json"

		curso_json = JSON.parse last_response.body

		last_response.status.should eql(200)
		curso_json["id"].should eql curso.id
	end

end