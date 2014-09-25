require 'rails_helper'

describe Curso, :type => :model do
	
	it "deve ser valido" do
		curso = create_curso

		curso.should be_valid
	end

	it "deve ser invalido sem inicio" do
		curso = create_curso({:inicio => nil})

		curso.should be_invalid
	end

	it "deve ser invalido sem fim" do
		curso = create_curso({:fim => nil})

		curso.should be_invalid
	end

	it "deve ser invalido sem descricao" do
		curso = create_curso({:descricao => nil})

		curso.should be_invalid
	end

	it "deve ser invalido sem instituicao" do
		curso = create_curso({:instituicao => nil})

		curso.should be_invalid
	end

	it "deve ser invalido com fim menor que inicio" do
		curso = create_curso({:fim => Date.new(2014, 01, 01), :inicio=> Date.new(2015, 01, 01)})

		curso.should be_invalid
	end

	it "deve ser possivel adicionar informacoes academcas para um cv" do
		cv = FactoryGirl.create(:cv)

		curso = Curso.new({
				:descricao => "Curso de Android",
				:inicio => Date.new(2013,01,01),
				:fim => Date.new(2014,01,01),
				:instituicao => "Laboratorio da Universidade Digital",
				:cv_id => cv.id
			})		

		cv.cursos.push curso
		cv.save

		curso.id.should be
	end

	private
		def create_curso(option = {})
			cv = FactoryGirl.create(:cv)
			Curso.create({
				:descricao => "Curso de Android",
				:inicio => Date.new(2013,01,01),
				:fim => Date.new(2014,01,01),
				:instituicao => "Laboratorio da Universidade Digital",
				:cv_id => cv.id
			}.merge(option))
		end

end
