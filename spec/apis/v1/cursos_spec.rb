require 'rails_helper'

describe '/api/v1/cvs/cursos', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/cursos" }

	it "atualizando um curso" do
		curso = cv.cursos[0]
		nome_curso = "Curso de Confeiteiro"

		put "#{url}/#{curso.id}.json",
			:curso => FactoryGirl.attributes_for(:curso)
								 .merge({
								 		:id => curso.id,
								 		:cv_id => cv.id,
								 		:descricao => nome_curso
								  })

		curso = JSON.parse last_response.body

		curso["id"].should be
		curso["descricao"].should eql(nome_curso)
		last_response.status.should eql(200)
	end	

	it "erro ao atualizar o curso com informações invalidas" do
		curso = cv.cursos[0]

		put "#{url}/#{curso.id}.json",
			:curso => FactoryGirl.attributes_for(:curso)
								 .merge({
								 		:id => curso.id,
								 		:cv_id => cv.id,
								 		:descricao => nil
								  })

		last_response.status.should eql(422)
	end

	it "adicionando um curso" do
		quantidade_antiga = Curso.where(:cv_id => cv.id).count
		curso = FactoryGirl.attributes_for(:curso)

		post "#{url}.json",
			 :curso => curso.merge(
			 				:cv_id => cv.id,
			 				:descricao => "Curso de Confeitaria"
			 		   )

		curso = JSON.parse last_response.body
		quantidade_nova = Curso.where(:cv_id => cv.id).count

		quantidade_nova.should be (quantidade_antiga + 1)
		curso["id"].should be
		curso["descricao"].should eql ("Curso de Confeitaria")
		last_response.status.should eql(201)
	end

	it "deve disparar um erro ao inserir informações invalidas" do
		curso = FactoryGirl.attributes_for(:curso)

		post "#{url}.json",
			 :curso => curso.merge(
			 				:cv_id => cv.id,
			 				:descricao => nil
			 		   )
		last_response.status.should eql(422)
	end

	it "removendo uma informação academica" do
		curso = cv.cursos[0]

		delete "#{url}/#{curso.id}.json"
		curso_deletado = Curso.find_by(:id => curso.id)

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