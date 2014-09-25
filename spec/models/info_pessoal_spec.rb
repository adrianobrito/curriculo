require 'rails_helper'

describe InfoPessoal, :type => :model do

	it "deve ser valido" do
		info_pessoal = create_info_pessoal

		info_pessoal.should be_valid
		info_pessoal.cv.should be
	end

	it "deve ser invalido sem cpf" do 
		info_pessoal = create_info_pessoal({:cpf => nil})
		
		info_pessoal.should be_invalid
	end

	it "deve ser invalido sem nome" do 
		info_pessoal = create_info_pessoal({:nome => nil})
		
		info_pessoal.should be_invalid
	end

	it "deve ser invalido sem nacionalidade" do 
		info_pessoal = create_info_pessoal({:nacionalidade => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem estadoCivil" do 
		info_pessoal = create_info_pessoal({:estadoCivil => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem endereco" do 
		info_pessoal = create_info_pessoal({:endereco => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem numeroEndereco" do 
		info_pessoal = create_info_pessoal({:numeroEndereco => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem complemento" do 
		info_pessoal = create_info_pessoal({:complemento => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem bairro" do 
		info_pessoal = create_info_pessoal({:bairro => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem cidade" do 
		info_pessoal = create_info_pessoal({:cidade => nil})
		
		info_pessoal.should be_invalid
	end
	
	it "deve ser invalido sem estado" do 
		info_pessoal = create_info_pessoal({:estado => nil})
		
		info_pessoal.should be_invalid
	end

	it "deve ser invalido sem telefone" do 
		info_pessoal = create_info_pessoal({:telefone => nil})
		
		info_pessoal.should be_invalid
	end

	it "deve ser possivel relacionar uma informacao pessoal a um cv" do
		cv = FactoryGirl.create(:cv)
		info_pessoal = InfoPessoal.new({
			:cpf => '03576025367',
			:nome => 'Adriano Sousa de Brito Bispo',
			:nacionalidade => 'Brasileiro',
			:estadoCivil => :casado, 
			:endereco => 'Rua Costa Sousa',
			:numeroEndereco => '71',
			:complemento => 'Apartamento C',
			:bairro => 'Benfica',
			:cidade => 'Fortaleza',
			:estado => 'Ceará',
			:telefone => '(85)89405519',
			:cv_id => cv.id
		})

		cv.info_pessoal = info_pessoal
		cv.save

		cv.info_pessoal.id.should be
	end

	private 
		def create_info_pessoal(option = {})
			cv = FactoryGirl.create(:cv)
			InfoPessoal.create({
				:cpf => '03576025367',
				:nome => 'Adriano Sousa de Brito Bispo',
				:nacionalidade => 'Brasileiro',
				:estadoCivil => :casado, 
				:endereco => 'Rua Costa Sousa',
				:numeroEndereco => '71',
				:complemento => 'Apartamento C',
				:bairro => 'Benfica',
				:cidade => 'Fortaleza',
				:estado => 'Ceará',
				:telefone => '(85)89405519',
				:cv_id => cv.id
			}.merge(option))
		end

end
