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

	it "deve ser invalido sem curso" do
		info_academica = create_info_academica({:curso => nil})

		info_academica.should be_invalid
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

	it "deve ser invalido sem cv" do
		info_academica = create_info_academica({:cv => nil})

		info_academica.should be_invalid
	end

	private
		def create_info_academica(option = {})
			cv = Cv.create

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
