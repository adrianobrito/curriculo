require 'spec_helper'

describe '/api/v1/cvs', :type => :api do

	context "criando um cv" do

		let(:url) { "/api/v1/cvs" }

		it "criando com sucesso" do
			post "#{url}.json", :cv => {
				:info_usuario => {
					:login => 'adrianobrito',
					:email => "adrianosdebrito@gmail.com",
					:senha => "modafoca"
				},
				:info_pessoal => {
					:cpf => '03576025367',
					:nome => 'Adriano Sousa de Brito Bispo',
					:nacionalidade => 'Brasileiro',
					:estadoCivil => 1, 
					:endereco => 'Rua Costa Sousa',
					:numeroEndereco => '71',
					:complemento => 'Apartamento C',
					:bairro => 'Benfica',
					:cidade => 'Fortaleza',
					:estado => 'Ceará',
					:telefone => '(85)89405519'
				},
				:info_academicas => [{
					:nivel => 2,
					:curso => "Computação - 8º Semestre",
					:incompleto => true,
					:instituicao => "Faculdade Farias Brito",
					:inicio => Date.new(2007,1,3),
					:fim => Date.new(2014,9,15)
				}],
				:info_profissionals => [{
					:inicio => Date.new(2013,01,01),
					:fim => Date.new(2013,01,01),
					:empresa => 'SEDUC',
					:cargo => 'Analista Desenvolvedor',
					:atividades => [{:descricao => 'Atividade Teste'}]
				}],
				:cursos => [{
					:descricao => "Curso de Android",
					:inicio => Date.new(2013,01,01),
					:fim => Date.new(2014,01,01),
					:instituicao => "Laboratorio da Universidade Digital"
				}],
				:qualificacaos => [{
					:descricao => "Java"
				}]
			}

			last_response.status.should eql(201)
			last_response.headers["Location"].should eql(route)
			last_response.body.should eql(project.to_json)

		end

	end


end