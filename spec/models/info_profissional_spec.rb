require 'rails_helper'

describe InfoProfissional, :type => :model do
 
	it "deve ser valido" do
		info_profissional = create_info_profissional

		info_profissional.should be_valid
	end
 
	it "deve ser invalido sem inicio" do
		info_profissional = create_info_profissional({:inicio => nil})

		info_profissional.should be_invalid
	end

	it "deve ser invalido sem fim" do
		info_profissional = create_info_profissional({:fim => nil})

		info_profissional.should be_invalid
	end

	it "deve ser invalido sem empresa" do
		info_profissional = create_info_profissional({:empresa => nil})

		info_profissional.should be_invalid
	end

	it "deve ser invalido sem cargo" do
		info_profissional = create_info_profissional({:cargo => nil})

		info_profissional.should be_invalid
	end

	it "deve ser invalido sem cv" do
		info_profissional = create_info_profissional({:cv_id => nil})

		info_profissional.should be_invalid
		info_profissional.cv.should be nil
	end

	it "deve ser invalido com fim menor que inicio" do
		info_academica = create_info_profissional({:fim => Date.new(2014, 01, 01), :inicio=> Date.new(2015, 01, 01)})

		info_academica.should be_invalid
	end

	private
		def create_info_profissional(options = {})
			cv = Cv.create
			InfoProfissional.create({
				:inicio => Date.new(2013,01,01),
				:fim => Date.new(2013,01,01),
				:empresa => 'SEDUC',
				:cargo => 'Analista Desenvolvedor',
				:cv_id => cv.id
			}.merge(options));
		end

end
