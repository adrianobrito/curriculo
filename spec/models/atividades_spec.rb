require 'rails_helper'

describe Atividade, :type => :model do
  
	it "deve ser valido" do
		atividade = create_atividade

		atividade.should be_valid
	end

	it "deve ser invalida sem descricao" do
		atividade = create_atividade(:descricao => nil)

		atividade.should be_invalid
	end

	private
		def create_atividade(options = {})
			cv = FactoryGirl.create(:cv)
			info_profissional = InfoProfissional.create({
				:inicio => Date.new(2013,01,01),
				:fim => Date.new(2013,01,01),
				:empresa => 'SEDUC',
				:cargo => 'Analista Desenvolvedor',
				:cv_id => cv.id
			});
			Atividade.create({:descricao => 'Atividades', 
							  :info_profissional_id => info_profissional.id
							 }.merge(options))
		end

end
