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

	it "deve ser invalido com fim menor que inicio" do
		info_academica = create_info_profissional({:fim => Date.new(2014, 01, 01), :inicio=> Date.new(2015, 01, 01)})

		info_academica.should be_invalid
	end

	it "deve ser possivel adicionar atividades em uma informacao profissional" do
		info_profissional = create_info_profissional
		atividade = Atividade.new({
			:descricao => 'Atividade Teste',
			:info_profissional_id => info_profissional.id
		})

		info_profissional.atividades.push atividade
		info_profissional.save

		atividade.id.should be
	end

	it "deve ser invalido salvar um curriculo sem atividades" do
		info_profissional = create_info_profissional({:atividades => []})

		info_profissional.should be_invalid
	end

	it "deve ser possivel adicionar informacoes profissionais a um curriculo" do
		cv = FactoryGirl.create(:cv)
		atividade = Atividade.new({:descricao => 'Atividade teste 1'})
		info_profissional = InfoProfissional.new({
			:inicio => Date.new(2013,01,01),
			:fim => Date.new(2013,01,01),
			:empresa => 'SEDUC',
			:cargo => 'Analista Desenvolvedor',
			:cv_id => cv.id,
			:atividades => [atividade]
		});

		cv.info_profissionals.push info_profissional
		cv.save

		atividade.id.should be
		info_profissional.id.should be
	end

	private
		def create_info_profissional(options = {})
			cv = FactoryGirl.create(:cv)
			
			atividade = Atividade.new({:descricao => 'Atividade teste 1'})

			InfoProfissional.create({
				:inicio => Date.new(2013,01,01),
				:fim => Date.new(2013,01,01),
				:empresa => 'SEDUC',
				:cargo => 'Analista Desenvolvedor',
				:cv_id => cv.id,
				:atividades => [atividade]
			}.merge(options));
		end

end
