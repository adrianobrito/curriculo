require 'rails_helper'

describe Atividades, :type => :model do
  
	it "deve ser valido" do
	end

	private
		def create_atividades
			cv = Cv.create
			Atividades.create(:descricao => 'Atividades')
		end

end
