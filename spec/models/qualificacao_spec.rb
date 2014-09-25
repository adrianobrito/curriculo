require 'rails_helper'

describe Qualificacao, :type => :model do

	it "deve ser valido" do
		qualificacao = create_qualificacao

		qualificacao.should be_valid
		qualificacao.cv.should be
	end

	it "deve ser invalido sem descricao" do
		qualificacao = create_qualificacao(:descricao => nil)

		qualificacao.should be_invalid		
	end

	it "deve ser possivel adicionar uma qualificacao a um cv" do
		cv = FactoryGirl.create(:cv)
		qualificacao = Qualificacao.new({:descricao => "Java", :cv_id => cv.id})

		cv.qualificacaos.push qualificacao
		cv.save

		qualificacao.id.should be 
	end

	private 
		def create_qualificacao(options = {})
			cv = FactoryGirl.create(:cv)
			Qualificacao.create({:descricao => "Java", :cv_id => cv.id}.merge(options))
		end
end
