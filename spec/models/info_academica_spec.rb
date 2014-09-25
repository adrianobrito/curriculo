require 'rails_helper'

describe InfoAcademica, :type => :model do
  
	it "deve ser valido" do
		info_academica = create_info_academica

		info_academica.should be_valid
		info_academica.cv.should be
	end

	it "deve ser invalido sem nivel" do
		info_academica = create_info_academica({:nivel => nil})

		info_academica.should be_invalid
	end

	it "deve ser invalido sem curso, caso seja graduacao, ou pos graduacao" do
		info_academica = create_info_academica({:curso => nil})

		info_academica.should be_invalid
	end

	it "deve ser valido sem curso, caso seja ensino fundamental ou medio" do
		info_academica = create_info_academica({:nivel => :ensino_fundamental, :curso => nil})

		info_academica.should be_valid
	end

	it "deve ser invalido sem verificação" do
		info_academica = create_info_academica({:incompleto => nil})

		info_academica.should be_invalid
	end

	it "deve ser invalido sem inicio" do
		info_academica = create_info_academica({:inicio => nil})

		info_academica.should be_invalid
	end

	it "deve ser invalido sem fim" do
		info_academica = create_info_academica({:fim => nil})

		info_academica.should be_invalid
	end

	it "deve ser invalido com fim menor que inicio" do
		info_academica = create_info_academica({:fim => Date.new(2014, 01, 01), :inicio=> Date.new(2015, 01, 01)})

		info_academica.should be_invalid
	end

	it "deve ser possivel adicionar informacoes academcas para um cv" do
		cv = FactoryGirl.create(:cv)

		info_academica = InfoAcademica.new({
			:nivel => :ensino_superior_graduacao,
			:curso => "Computação - 8º Semestre",
			:incompleto => true,
			:instituicao => "Faculdade Farias Brito",
			:inicio => Date.new(2007,1,3),
			:fim => Date.new(2014,9,15) ,
			:cv_id => cv.id
		})		

		cv.info_academicas.push info_academica
		cv.save

		info_academica.id.should be
	end

	private
		def create_info_academica(option = {})
			cv = FactoryGirl.create(:cv)

			InfoAcademica.create({
				:nivel => :ensino_superior_graduacao,
				:curso => "Computação - 8º Semestre",
				:incompleto => true,
				:instituicao => "Faculdade Farias Brito",
				:inicio => Date.new(2007,1,3),
				:fim => Date.new(2014,9,15) ,
				:cv_id => cv.id
			}.merge(option))
		end

end
